//
//  communications.swift
//  Amber Scan
//
//  Created by Harry Atwal on 9/4/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//
import UIKit
import Foundation


//Displays Results of a spotting from all algorithms
class resultsController: UIViewController {
    var dataSourceArray = ["Status", "Gender", "Age", "Race", "Pose", "Glasses"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = globalData.backgroundColor
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
