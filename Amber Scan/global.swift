///Users/Harry/Dropbox/Thesis/Project/Amber Scan/Amber Scan/global.swift
//  global.swift
//  Amber Scan
//
//  Created by Harry Atwal on 6/15/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//  This global class will be accessible from all methods

import Foundation
import UIKit

class Main {
    var colorScheme : [String : UIColor]
    var version :String
    var appversion : String
    var spottingId: String
    var apiAddress: String
    var results: String
    var segueSwitch: Double
    var rocResults: String
    var backgroundColor: UIColor

    //var comms : communications
    
    init(version:String, spottingId:String, apiAddress:String) {
        self.colorScheme = [ "Beige" : UIColor(string: "e8d1a7"),
            "DarkBeige" : UIColor(string: "aea698"),
            "BlandTeal" : UIColor(string: "b8d5d0"),
            "LightGrey" : UIColor(string: "f3f9f9"),
            "LightBlue" : UIColor(string: "a1cae7"),
            "DarkNavy" :  UIColor(string: "618791"),
            "Black" : UIColor(string: "ffffff")
        ]
        self.version = version
        self.appversion = "0.1.1"
        self.spottingId = spottingId
        self.apiAddress = apiAddress
        self.results = "Null"
        self.segueSwitch = 0.0
        self.rocResults = ""
        self.backgroundColor = UIColor(string: "000000") //BLack
    }
    
    func updateVersionNumber(versionNumber : String) -> Void
    {
       self.version = versionNumber
    }
    
    
}

extension UIColor {
    convenience init(string: String) {
        var chars = Array(string.hasPrefix("#") ? string.characters.dropFirst() : string.characters)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
        switch chars.count {
        case 3:
            chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            alpha = 0
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}

var globalData = Main(version:"0.0.0", spottingId:"0", apiAddress:"https://faceaginggroup.com/amberscan")

