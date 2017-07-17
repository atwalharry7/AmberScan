//
//  restfulTesting.swift
//  Amber Scan
//
//  Created by Harry Atwal on 5/29/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//
//
//  SubmissionViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/12/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit
import Foundation

class restfulTesting: UIViewController {
    var counter = 0
    //Text Field to display contents of the API Packet
    @IBOutlet var d_version: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Loaded Restful testing module")
        print("The global api address is: \(globalData.apiAddress)")
        
        
        //Testing API RESTful requesting
        //let data = fetchSpotting(id:"591a089a95c1d27e8ed08974")
        //updateTextField(contents: data)
        
        //-----Working to send in a JSON packer
        //let submissionPacket = ["FirstName":"Mark", "LastName":"Atwal"]
        //submitSpotting(data: submissionPacket)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateSwitch(_ sender: Any) {
        print("Attempting to fetch version ")
        communications.getVersion(completion: updateVersionNumber(versionNumber: ))
    }
    //Function is used as a callback function to update the text field and global version numbers
    func updateVersionNumber(versionNumber : String) -> Void
    {
        globalData.version = versionNumber
        d_version.text = versionNumber
    }
    
    
}
