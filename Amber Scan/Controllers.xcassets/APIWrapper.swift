//
//  APIWrapper.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/30/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation


//This Class will house all the code for sending/Receiving data to the Amber Scan API.
public class APIWrapper {
    class func post(id: String, test: String, data: Any) {
        
//        var apiEndpointURL : String = "api.harryatwal.com/spottings"
//        print("The API Enpoint is /(apiEndpointURL)")
        
        
//        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
//            let json = JSON(data: dataFromString)
//        }
//        
//        var apiEndpointURL = URL(String: "api.harryatwal.com/spottings")
//        var apiEndpoint = NSURL(URL: "api.harryatwal.com/spottings")
        
            
//        if id == "" && test == "" {
//            notesEndpoint = NSURL(string: Stormpath.sharedSession.configuration.APIURL.absoluteString + "/participant")!
//        } else if id != "" && test == "" {
//            notesEndpoint = NSURL(string: Stormpath.sharedSession.configuration.APIURL.absoluteString + "/participant/" + id)!
//        } else if id != "" && test != "" {
//            notesEndpoint = NSURL(string: Stormpath.sharedSession.configuration.APIURL.absoluteString + "/participant/" + id + "/" + test)!
//        }
//        
//        let request = NSMutableURLRequest(url: notesEndpoint as URL)
//        
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
//        request.setValue("application/json" , forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request as URLRequest)
//        
//        task.resume()
    }
}
