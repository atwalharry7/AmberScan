//
//  global.swift
//  Amber Scan
//
//  Created by Harry Atwal on 6/15/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//  This global class will be accessible from all methods

import Foundation

class Main {
    var version :String
    var spottingId: String
    var apiAddress: String
    var results: String
    var segueSwitch: Double
    var rocResults: String
    //var comms : communications
    
    init(version:String, spottingId:String, apiAddress:String) {
        self.version = version
        self.spottingId = spottingId
        self.apiAddress = apiAddress
        self.results = "Null"
        self.segueSwitch = 0.0
        self.rocResults = ""
    }
    
    func updateVersionNumber(versionNumber : String) -> Void
    {
       self.version = versionNumber
    }
}

var globalData = Main(version:"0.0.0", spottingId:"0", apiAddress:"https://faceaginggroup.com/amberscan")

