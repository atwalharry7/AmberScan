//
//  ReportASightingViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit
import CoreLocation


class ReportASightingViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var name_spotting  : String = String()
    var street_spotting  : String = String()
    var city_spotting  : String = String()
    var zipcode_spotting  : String = String()
    var contact_spotting  : String = String()
    var spottingID : String = String()
    var subjectName: String = String()
    var geoCoord: String = String()
    var latLongCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()

    @IBOutlet weak var s_Name: UITextField?
    @IBOutlet var s_Street: UITextField!
    @IBOutlet var s_City: UITextField!
    @IBOutlet var s_Zip: UITextField!
    @IBOutlet var s_Contact: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = globalData.backgroundColor
        // Do any additional setup after loading the view.
        
        //If the user clicks outside of a text field, dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ReportASightingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Go ahead and ask for the users location
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        
    }
    //Funciton called whenever user taps outside of text field
    func dismissKeyboard ()
    {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("The Location system's current coordinates.")
            print(location.coordinate)
            self.latLongCoord = location.coordinate
        }
    }
    
    
    @IBAction func SubmitSighting(_ sender: Any) {
        
        //Retreive Data from text Fields
        name_spotting = String(s_Name?.text ?? "NULL")
        street_spotting = String(s_Street?.text ?? "NULL")
        city_spotting = String(s_City?.text ?? "NULL")
        zipcode_spotting = String(s_Zip?.text ?? " ")
        contact_spotting = String(s_Contact?.text ?? " ")
        subjectName = String(globalData.spottedChildName)
        geoCoord = "Lat: " + String(self.latLongCoord.latitude) + ", Long:" + String(self.latLongCoord.longitude)
        
        //Construct Data Packet to send to API
        let dataPacket = ["name" : "Amber Scan",
                          "street":"123 Candy Cane Lane",
                          "city":"North Pole",
                          "zip":"11111",
                          "contact":"9995555555"]
        
        let dataPacket2 = ["name" : name_spotting,
                                  "street":street_spotting,
                                  "city":city_spotting,
                                  "zip":zipcode_spotting,
                                  "contact":contact_spotting,
                                  "missingChildName":subjectName,
                                  "submissionCoordinates":geoCoord]
        print("Data Packet 1: \n")
        print(dataPacket)
        print("Data Packet 1: \n")
        print(dataPacket2)
        

            //KNOWN working
//        let dataPacket = ["name" : "Amber Scan",
//                          "street":"123 Candy Cane Lane",
//                          "city":"North Pole",
//                          "zip":"11111",
//                          "contact":"9995555555"]

        
        //print("DATA PACKET --------------- --------------- ")
        //print(dataPacket)
        
        // TODO Need to encapsulate this code with a delegate to move the user onto the next screen while the spotting is being sent off in the background.
        spottingID = communications.submitSpotting(data: dataPacket2)
        
        //Take the spotting id and keep it as a class variable.
        print("\n The spotting id returned is: \(spottingID) \n ")
        globalData.spottingId = spottingID
        performSegue(withIdentifier: "formSubmitted", sender: self)
        
    }
}
