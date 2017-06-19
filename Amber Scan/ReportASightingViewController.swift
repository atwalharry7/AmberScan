//
//  ReportASightingViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit


class ReportASightingViewController: UIViewController {
    
    var name_spotting  : String = String()
    var street_spotting  : String = String()
    var city_spotting  : String = String()
    var zipcode_spotting  : String = String()
    var contact_spotting  : String = String()
    var spottingID : String = String()

    @IBOutlet weak var s_Name: UITextField?
    @IBOutlet var s_Street: UITextField!
    @IBOutlet var s_City: UITextField!
    @IBOutlet var s_Zip: UITextField!
    @IBOutlet var s_Contact: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitSighting(_ sender: Any) {
        //Retreive Data from text Fields
        name_spotting = s_Name?.text ?? ""
        street_spotting = s_Street?.text ?? ""
        city_spotting = s_City?.text ?? ""
        zipcode_spotting = s_Zip?.text ?? ""
        contact_spotting = s_Contact?.text ?? ""
    
        //Construct Data Packet to send to API
        //        let dataPacket = ["name" : name_spotting,
        //                          "street":street_spotting,
        //                          "city":city_spotting,
        //                          "zip":zipcode_spotting,
        //                          "contact":contact_spotting]
        
        //Construct Data Packet to send to API
        let dataPacket = ["name" : "Amber Scan",
                          "street":"123 Candy Cane Lane",
                          "city":"North Pole",
                          "zip":"11111",
                          "contact":"9995555555"]
        
        // TODO Need to encapsulate this code with a delegate to move the user onto the next screen while the spotting is being sent off in the background.
        let comModue = communications()
        spottingID = comModue.submitSpotting(data: dataPacket)
        
        //Take the spotting id and keep it as a class variable.
        print("\n The spotting id returned is: \(spottingID) \n ")
        globalData.spottingId = spottingID
        performSegue(withIdentifier: "formSubmitted", sender: self)
        
    }
}
