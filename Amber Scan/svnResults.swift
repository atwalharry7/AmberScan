//
//  svnResults.swift
//  
//
//  Created by Harry Atwal on 10/30/17.
//

import Foundation
import UIKit

class svnResults : UIViewController {
    //Text Field to display contents of the API Packet
    @IBOutlet weak var svnA: UIImageView!
    @IBOutlet weak var svnB: UIImageView!
    @IBOutlet weak var svnC: UIImageView!
    
    @IBOutlet weak var svnA_age: UILabel!
    @IBOutlet weak var svnB_age: UILabel!
    @IBOutlet weak var svnC_age: UILabel!
    
    @IBOutlet weak var svnA_confidence: UILabel!
    @IBOutlet weak var svnB_confidence: UILabel!
    @IBOutlet weak var svnC_confidence: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Refresh the data '
        
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
