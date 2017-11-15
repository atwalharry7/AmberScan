//
//  myCell.swift
//  Amber Scan
//
//  Created by Harry Atwal on 11/12/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit
import Foundation

class myCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    var selection: Int = 0 //The missing child being selected.
    
    @IBOutlet weak var childSelectionButton: UIButton!
    //Method that is fired whenever the user clicks on a missing child.
    @IBAction func childSelectionButton(_ sender: Any) {
        
    }
    
    
}
