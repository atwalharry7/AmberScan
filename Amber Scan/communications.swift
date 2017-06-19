//
//  communications.swift
//  Amber Scan
//
//  Created by Harry Atwal on 6/14/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit

class communications: UIViewController {
    
    let apiAddress = globalData.apiAddress
    //Text Field to display contents of the API Packet
    @IBOutlet var apiResults: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiResults.isEditable = false
        apiResults.isScrollEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAPIRequest(_ sender: Any) {
        let data = fetchSpotting(id:"591a083c95c1d27e8ed08973")
        updateTextField(contents: data)
    }
    
    //Update the TextField with dictionary
    func updateTextField (contents: [String: Any])
    {
        print("The contents of passed in string \(contents.count)")
        var TextString = String();
        for (d1: d2) in contents
        {
            print("D2 content \(d2)")
            TextString += ":" + String(describing: d2) + "\n";
        }
        print("The text string is \(TextString)")
        apiResults.text = TextString;
    }
    
    //Retrive an spotting based on an ID, returns the tuple array from JSON packet
    func fetchSpotting (id: String="592e2e0906c32530bfbb224b" ) -> [String: Any]
    {
        let endpoint = apiAddress + "/api/spotting/" + id ;
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
    func fetchAllSpottings ()
    {
        let endpoint = apiAddress + "/api/spottings" ;
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
    func submitSpotting ( data:[String:Any]) -> String {
        var spottingID = ""

        let submissionData = data
        //Create a string to hold the api address, guard checks to make sure the URL is valid.
        let todoEndpoint: String = apiAddress + "/api/spotting"
        guard let url = URL(string: todoEndpoint) else {
            print("Error 4: cannot create URL: Invalid URL")
            return "4000"
        }
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
                print("error parsing response from POST on /debug")
                return
             }
        }
        task.resume()
        
        //Before returning the value, we're going to sleep for a few seconds to makes sure the response packet's data value comes back to us. 
        for i in 0...5{
            sleep(1)
            if spottingID != ""{
                break
            }
            else if i == 4{
                spottingID = "Error 5: Submit Spotting Timeout"
                break
            }
        }
        return spottingID
    }
    
    // Get the API version (New Method)
//    class func fetchVersion (completionHandler: @escaping ((_ result:String) -> Void) )
    class func fetchVersion () -> String
    {
        let apiAddress = globalData.apiAddress
        //Create a string to hold the api address, guard checks to make sure the URL is valid.
        let todoEndpoint: String = apiAddress + "/version"
        var versionNumber = "N/A"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
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
        for i in 0...5{
            sleep(1)
            if versionNumber != "N/A"{
                break
            }
            else if i == 4{
                versionNumber = "Error 2: Version Number Error"
                break
            }
        }
        return versionNumber
    }
    
    
}

