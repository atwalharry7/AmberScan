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
    let apiAddress = "http://localhost:3030"
    //Text Field to display contents of the API Packet
    @IBOutlet var apiResults: UITextView!

    @IBAction func submitAPIRequest(_ sender: Any) {
        
        let versionNumber = communications.fetchVersion()
        let displayText = "Current Count = \(counter) & Version = \(versionNumber)"
        apiResults.text = displayText
        counter += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiResults.isEditable = false
        apiResults.isScrollEnabled = true
        
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
    
    
}
