//
//  communications.swift
//  Amber Scan
//
//  Created by Harry Atwal on 6/14/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class communications: UIViewController {
    
    //Text Field to display contents of the API Packet
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Retrive an spotting based on an ID, returns the tuple array from JSON packet
    class func fetchSpotting (id: String="592e2e0906c32530bfbb224b" ) -> [String: Any]
    {
        let endpoint = globalData.apiAddress + "/api/spotting/" + id ;
        let apiURL = URL(string: endpoint)
        var output = [String: Any]()
        //        let t1 = URLSession.
        let task = URLSession.shared.dataTask(with: apiURL!) {(data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else{
                print("No Error detected during request")
                // If there is no content in the URL request, then don't do anything.
                if let content = data
                {
                    let myJson = try? JSONSerialization.jsonObject(with: content, options: [])
                    //Turn the JSON data into a dictionary that can be used
                    if let data = myJson as? [String: Any]
                    {
                        print("Size of data returned from GET \(data.count)")
                        output = data
                    }
                    else
                    {
                        print("Couldn't output the correct data field");
                        print (myJson ?? "Error during JSON parsing");
                        output = ["Error": "None"]
                    }
                }
            }
        }
        task.resume()
        print("Size of data being returned \(output.count)")
        return (output)
    }
    
    //Retrieve all spottings
    class func fetchAllSpottings ()
    {
        let endpoint = globalData.apiAddress + "/api/spottings" ;
        let apiURL = URL(string: endpoint)
        //Set the api address that we'll be fetching the version from. Make sure version is at least 1.0
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else{
                print("No Error detected during request")
                // If there is no content in the URL request, then don't do anything.
                if let content = data
                {
                    let myJson = try? JSONSerialization.jsonObject(with: content, options: [])
                    //Turn the JSON data into a dictionary that can be used
                    if let data = myJson as? [String: Any]
                    {
                        print (data);
                    }
                    else
                    {
                        print("Couldn't output the correct data field")
                        print (myJson ?? "Error during JSON parsing")
                    }
                }
            }
        }
        task.resume()
    }
    
    //Submit spotting data to API
    class func submitSpotting ( data:[String:Any]) -> String
    {
    
        var spottingID = ""
        let submissionData = data
        //Create a string to hold the api address, guard checks to make sure the URL is valid.
        let versionURL: String = globalData.apiAddress + "/api/spotting"
        guard let url = URL(string: versionURL) else {
            print("Error 4: cannot create URL: Invalid URL")
            return "4000"
        }
        print(versionURL)
        //Setup URL Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json" , forHTTPHeaderField: "Content-Type")
        
        //Encode the form data into JSON for submission
        var jsonSpotting: Data
        do {
            jsonSpotting = try JSONSerialization.data(withJSONObject: submissionData, options: [])
            urlRequest.httpBody = jsonSpotting
        } catch {
            print("Error: cannot create JSON from spotting")
            return "Error 3 : Could not create JSON packet"
        }
        
        
        // Call the URLSession library to perform the post request to webserver
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /api/spotting")
                print(error)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
//            guard let spottingID = response else{
//                print("No spottingId returned")
//                spottingID = 0
//                return
//            }
        
            //If there is a return packet, then do something with the response data.
            do {
                guard let recievedID = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]
                else {
                    print("Could not get JSON from responseData as dictionary")
                    return
                }
                guard let parsedID = recievedID["_id"] as? String else {
                    print("Could not get valid idpacket as int from JSON")
                    return
                 }
                    spottingID = String(parsedID)
                    //print("The ID is: \(spottingID)")
             }
             catch  {
                print("error parsing response from POST on /debug, data receieved: ")
                print(responseData.description)
                return
             }
        }
        task.resume()
        
        //Before returning the value, we're going to sleep for a few seconds to makes sure the response packet's data value comes back to us. 
        for i in 0...10{
            sleep(1)
            if spottingID != ""{
                break
            }
            else if i == 9{
                spottingID = "Error 5: Submit Spotting Timeout"
                break
            }
        }
        return spottingID
    }
    
    // Get the API version (New Method) - Non Alamofire way
//    class func fetchVersion (completionHandler: @escaping ((_ result:String) -> Void) )
    class func fetchVersion () -> String
    {
        print("Version Retrieval method called")
        let apiAddress = globalData.apiAddress
        print("apiAddress : \(apiAddress)")
        //Create a string to hold the api address, guard checks to make sure the URL is valid.
        let versionURL: String = apiAddress + "/version"
        print("The versionURL is \(versionURL)")
        var versionNumber = "N/A"
        guard let url = URL(string: versionURL) else {
            print("Error 5: cannot create URL")
             return ""
        }
        let urlRequest = URLRequest(url: url)
        //Declare the completion handler separate and pass it in as a vairable to the sessions task.
        let myCompletionHandler: (Data?, URLResponse?, Error?) -> Void = { (data, response, error) in
            var version: String
            if let responseContent = data //Check to make sure the data packet is received
            {
                //print("Data Packet recieved, data is: ")
                //print(data)
                //Decode JSON
                let jsonData = try? JSONSerialization.jsonObject(with: responseContent, options: [])
                if let decodedData = jsonData as? [String:Any]
                {
                    version = String(describing: decodedData["version"]!)
                    versionNumber = version
                }
            }
            else
            {
                print("No response from server")
                version = "Error 1: Version Number Error"
            }
        }
        // Call the URLSession library to perform a GET request to webserver
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: myCompletionHandler)
        task.resume()
        for i in 0...10{
            sleep(1)
            if versionNumber != "N/A"{
                break
            }
            else if i == 4{
                versionNumber = "Error 2: Version Number Error"
                break
            }
        }
        //Update global variable to account for the latest version
        globalData.version = versionNumber
        return versionNumber
    }
    
    // Submit an image and the id associated with that image.
    /*
    class func submitImage ( image: UIImage, imageID: String)
    {
        print("Submitting Image - Checkpoint 2")
        //Gather variables for the submission.
        var spottingID = globalData.spottingId
        let spottingImage = image
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64Image = imageData.base64EncodedString(options: .lineLength64Characters)
        
        //Create a string to hold the api address, guard checks to make sure the URL is valid.
        let uploadURL: String = globalData.apiAddress + "/api/upload"
        guard let url = URL(string: uploadURL) else {
            print("Error 5: cannot create URL: Invalid URL")
            return
        }
        
        //Setup URL Request
        let boundaryConstant = "Boundary-HE726CGELCI29";
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //urlRequest.setValue("multipart/form-data; boundary=" + boundary, forHTTPHeaderField: "Content-Type")
        
        
        // Set Content-Type in HTTP header.
        let contentType = "multipart/form-data; boundary=" + boundaryConstant
        let fileName = imageID
        let mimeType = "file/png"

        
        urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        // Set data
        var error: NSError?
        var body = NSMutableData()
        
        let path1 = Bundle.main.path(forResource:"Image1", ofType: "png")
        
        
        var dataString = "--\(boundaryConstant)\r\n"
        dataString += "Content-Disposition: form-data; imageName=\"\(fileName)\"; image\"\r\n"
        dataString += "Content-Type: \(mimeType)\r\n\r\n"
        dataString += strBase64Image
        dataString += "\r\n"
        dataString += "--\(boundaryConstant)--\r\n"
        
        print(dataString) // This would allow you to see what the dataString looks like
        
        //Set the HTTPBody we'd like to submit
        urlRequest.httpBody = dataString.data(using: String.Encoding.utf8)
        var jsonSpotting: Data
        
        /*
        do {
            jsonSpotting = try JSONSerialization.data(withJSONObject: submissionData, options: [])
            urlRequest.httpBody = jsonSpotting
        } catch {
            print("Error: cannot create JSON from spotting")
            return "Error 3 : Could not create JSON packet"
        }
        
        // Call the URLSession library to perform the post request to webserver
 */
        
        let session = URLSession.shared
 
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /api/upload")
                print(error)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            //            guard let spottingID = response else{
            //                print("No spottingId returned")
            //                spottingID = 0
            //                return
            //            }
            
            //If there is a return packet, then do something with the response data.
            do {
                guard let recievedID = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]
                    else {
                        print("Could not get JSON from responseData as dictionary")
                        return
                }
                guard let parsedID = recievedID["_id"] as? String else {
                    print("Could not get valid idpacket as int from JSON")
                    return
                }
                spottingID = String(parsedID)
                //print("The ID is: \(spottingID)")
            }
            catch  {
                print("error parsing response from POST on /debug")
                return
            }
        }
 
        task.resume()
    }
     */
    
    class func getVersion (completion:@escaping (String) -> Void)
    {
        var versionNumber = "0"
        let versionURL: String = globalData.apiAddress + "/version"
        Alamofire.request(versionURL, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                //            print(response.request)  // original URL request
                //            print(response.response) // URL response
                //            print(response.data)     // server data
                //            print(response.result)   // result of response serialization
                //If the request is successful.
                if response.result.isSuccess {
                    //to get JSON return value
                    if let result = response.result.value {
                        //let JSON = result as! NSDictionary
                        let JSON = result as! [String : Any?]
                        versionNumber = JSON["version"] as! String
                        //versionNumber = JSON["version"].debugDescription
                        print("Version number \(versionNumber)\n")
                        completion(versionNumber)
                    }
                    else{
                        print("Invalid Response")
                        completion(versionNumber)
                    }
                }
        }
    }
    
    
    // Submit image using AlamoFire
    func submitImage (subImage: UIImage, imageID: String)
    {
        print("AlamoFire submit Image called")
        print("\n -------------------------------- \n")
        //var submissionCode = "Unsubmitted"
        //var submissionURL = globalData.apiAddress + "/api/upload"
        let submissionURL = globalData.apiAddress + "/api/debugUpload"
        let imageName = globalData.spottingId.description + ".png"
                        //Convert name to type data
        let imageNameData = imageName.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        //Prepare image for transmission
        //let image: Data = subImage as! Data
        //let dataDecoded : Data = Data(base64Encoded: image, options: [])!
        
        let image = UIImagePNGRepresentation(subImage)
        
        //Create Multipart form with image
        Alamofire.upload(
            multipartFormData:{ multipartFormData in
                //Add the image to the form last.
                    multipartFormData.append(imageNameData, withName: "imageName" )
                    multipartFormData.append(image!, withName: "image", fileName: imageName, mimeType: "image/png")
                },
            to: submissionURL,
            encodingCompletion: { encodingResult in
                    switch encodingResult {
                     case .success(let upload, _, _):
                        upload.responseJSON { response in
                            print("Successful request, code: \(upload.response?.statusCode ?? 0)")
                        }
                        // Update Progress bar
                        upload.uploadProgress { progress in
                            print(progress.fractionCompleted)
                            //Code for updating progress bar.
                            
                            //SubmissionViewController().updateProgressBar(percentage: progress.fractionCompleted)
                        }
                    case .failure(let encodingError):
                        print("The request is: ")
                        print(encodingError)
                    }
                }
            )
    }
}



/** Asynchronous function that will retrieve the version.
 Requires a callback function to hold the version number. You can use
 { (globalData.version) }
 **/




