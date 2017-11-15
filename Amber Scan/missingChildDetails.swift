//
//  missingChildDetails.swift
//  Amber Scan
//
//  Created by Harry Atwal on 11/13/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit

class missingChildDetails: UIViewController {
    
    @IBOutlet weak var nameOfChild: UILabel!
    @IBOutlet weak var missingChildImage: UIImageView!
    @IBOutlet weak var missingSince: UILabel!
    @IBOutlet weak var missingFrom: UILabel!
    @IBOutlet weak var childDOB: UILabel!
    @IBOutlet weak var ageNow: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var eyeColor: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var notes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        //Retrive the current subject being looked at and populate fields with their data
        
        let currentChildID = Int(globalData.currentAlert)
        self.nameOfChild.text = globalData.missingKids[currentChildID]
        self.missingChildImage.image = UIImage(named:globalData.missingKids[currentChildID] + ".jpg")
        self.missingSince.text = globalData.missingSince[currentChildID]
        self.missingFrom.text = globalData.missingFrom[currentChildID]
        self.childDOB.text = globalData.dob[currentChildID]
        self.ageNow.text = globalData.ageNow[currentChildID]
        self.gender.text = globalData.sex[currentChildID]
        self.race.text = globalData.race[currentChildID]
        self.hairColor.text = globalData.hairColor[currentChildID]
        self.eyeColor.text = globalData.eyeColor[currentChildID]
        self.height.text = globalData.height[currentChildID]
        self.weight.text = globalData.weight[currentChildID]
        self.notes.text = globalData.notes[currentChildID]
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
