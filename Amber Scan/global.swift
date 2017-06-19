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
    init(version:String, spottingId:String, apiAddress:String) {
        self.version = version
        self.spottingId = spottingId
        self.apiAddress = apiAddress
    }
}

var retrievedVersion = communications.fetchVersion()
var globalData = Main(version:retrievedVersion, spottingId:"0", apiAddress:"http://localhost:3030")
