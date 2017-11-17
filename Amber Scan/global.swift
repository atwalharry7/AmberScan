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
    var submissionResults: String
    var spottedChildName: String
    var spottingGPS: String
    var backgroundColor: UIColor
    
    var currentAlert: Int
    var missingKids: [String]
    var missingSince: [String]
    var missingFrom: [String]
    var dob: [String]
    var ageNow: [String]
    var sex: [String]
    var race: [String]
    var hairColor: [String]
    var eyeColor: [String]
    var height: [String]
    var weight: [String]
    var notes: [String]
    
    
    

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
        self.submissionResults = ""
        self.spottedChildName = ""
        self.spottingGPS = "User Opted Out"
        self.backgroundColor = UIColor(string: "000000") //BLack
        self.currentAlert = 0
        
        
        self.missingKids = [ "Angella Russel", "Elyana Russell", "Elias Russell", "Imahni Russell", "Adrionna Dull", "Robin Strother", "Zhi Ying Zhen", "Earl Wilson", "Tyrese Hill", "Machaela Hardie", "Jeffrey Reynolds",  "Mariamu William", "Jeffrey Reynolds", "Karam Govens", "Nidia Balderrama" ]
        self.missingSince = ["Jul 4, 2017", "Jul 4, 2017", "Jul 4, 2017", "Jul 4, 2017","Aug 5, 2017","Aug 8, 2017","Aug 21, 2017","Sep 14, 2017","Sep 19, 2017","Sep 25, 2017","Sep 27, 2017", "Sep 28, 2017", "Sep 27, 2017", "Sep 22, 2017", "Oct 6, 2017"]
        self.missingFrom = ["Washoe Valley, NV", "Washoe Valley, NV", "Washoe Valley, NV", "Washoe Valley, NV","Hohenwald, TN","Kansas City, MO","San Francisco, CA","Dolton, IL","South Holland, IL","Richmond, VA" ,"Columbus, OH" , "Philadelphia, PA", "Columbus, OH", "Port Saint Lucie, FL", "Kansas City, KS"]
        self.dob = ["Jul 27, 2001", "Apr 22, 2004", "Apr 22, 2004","Oct 4, 2007","Nov 10, 2000","Apr 21, 2003","Aug 4, 2001","Oct 3, 2002","Oct 22, 2002","Jul 7, 2001","Oct 7, 2002", "Jul 29, 2001", "Oct 7, 2002", "Aug 5, 2009", "Jun 10, 2001"]
        self.ageNow = ["16", "13", "13", "10","17","14","16","15","15","16","15", "16", "15", "8", "16"]
        self.sex = ["Female", "Female", "Male", "Male","Female","Male","Female","Male","Male","Female","Male", "Female", "Male", "Male", "Female"]
        self.race = ["Biracial", "Biracial", "Biracial", "Biracial","Biracial","Black","Asian","Black","Black","White","White", "Black" ,"White", "Black", "Hispanic"]
        self.hairColor = ["Brown", "Brown", "Brown", "Brown","Black","Black","Black","Black","Black","Brown","Brown", "Black", "Brown", "Black", "Black"]
        self.eyeColor = ["Brown", "Hazel", "Hazel", "Hazel","Brown","Brown","Black","Brown","Black","Brown","Brown", "Brown", "Brown", "Black", "Brown"]
        self.height = ["5'4", "5'2", "5'5", "4'0","5'8","5'3","5'4","5'7","5'7","5'5","5'7", "5'1", "5'7", "5'0", "5'0"]
        self.weight = ["120 lbs","100 lbs", "100 lbs", "60 lbs","130","120","150","150","160","200","124", "127", "124", "60", "150"]
        self.notes = ["Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                              "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                              "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                              "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                              "Adrionna was last seen on August 5, 2017. She is biracial. Adrionna is Black and Hispanic.","",
                              "Zhi Ying may still be in the local area or she may travel to Phoenix, Arizona or El Paso, Texas. She may go by the alias name Jennifer.",
                              "Earl may be in the company of an adult female. They may travel to Chicago, Illinois.",
                              "Tyrese may travel to Harvey, Illinois.",
                              "She may be in the company of her mother. When Machaela was last seen, her hair was dyed red. CAUTION ADVISED: If located, do not approach and immediately contact law enforcement.",
                              "He may still be in the local area or he may travel to Texas.", "Mariamu may still be in the local area or she may travel to Darby, Pennsylvania. She has multiple tattoos",
                              "Jeffrey was last seen on September 27, 2017. He may still be in the local area or he may travel to Texas.",
                              "Karam was last seen at home on September 22, 2017. He may be in the company of his mother, Georgia Brown.",
                              "Both photos shown are of Nidia. She may still be in the local area or she may travel to Kansas City, Missouri. Nidia's lip is pierced."
        ]
        
        
        
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

