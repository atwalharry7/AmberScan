//
//  resultsViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 10/29/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit

class rankOneResults: UIViewController {
    @IBOutlet weak var rankOneA: UIImageView!
    @IBOutlet weak var rankOneB: UIImageView!
    @IBOutlet weak var rankOneC: UIImageView!
    
    @IBOutlet weak var rankOneA_age: UILabel!
    @IBOutlet weak var rankOneB_age: UILabel!
    @IBOutlet weak var rankOneC_age: UILabel!
    
    @IBOutlet weak var rankOneA_confidence: UILabel!
    @IBOutlet weak var rankOneB_confidence: UILabel!
    @IBOutlet weak var rankOneC_confidence: UILabel!
    
    @IBOutlet weak var rankOneStatusLabel: UILabel!
    var resultCounter = 0
    
    //Text Field to display contents of the API Packet
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Refresh the data on load, meaning fetch the images from the urls and update the age and confidence labels
        //Check to see if the results are in or not.
        if(globalData.submissionResults == ""){
            if(resultCounter == 0) {
                self.rankOneStatusLabel.text = "Still Processing"
                resultCounter += 1
            }
            else {
                var text = "Processing"
                for _ in 1...resultCounter{
                    text += "."
                }
               self.rankOneStatusLabel.text = text
                resultCounter += 1
            }
        }
        else{
            //Since the data has returned, grab the strings that talk about rank one results
            //self.rankOneStatusLabel.text = globalData.submissionResults
            self.rankOneStatusLabel.text = "Still processing"
        }
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

