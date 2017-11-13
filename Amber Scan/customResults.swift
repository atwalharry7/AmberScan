//
//  resultsViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 10/29/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit

class customResults: UIViewController {
    @IBOutlet weak var customA: UIImageView!
    @IBOutlet weak var customB: UIImageView!
    @IBOutlet weak var customC: UIImageView!
    
    @IBOutlet weak var customA_age: UILabel!
    @IBOutlet weak var customB_age: UILabel!
    @IBOutlet weak var customC_age: UILabel!
    
    @IBOutlet weak var customA_confidence: UILabel!
    @IBOutlet weak var customB_confidence: UILabel!
    @IBOutlet weak var customC_confidence: UILabel!
    
    
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
    
}

