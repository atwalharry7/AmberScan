//
//  ActiveAlertsViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit

class ActiveAlertsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let missingKids:[String] = [ "Angella Russel", "Elyana Russell", "Elias Russell", "Imahni Russell", "Adrionna Dull", "Robin Strother", "Zhi Ying Zhen", "Earl Wilson", "Tyrese Hill", "Machaela Hardie", "Jeffrey Reynolds",  "Mariamu William", "Jeffrey Reynolds", "Karam Govens", "Nidia Balderrama"  ]
    
    @IBOutlet weak var myCollectionLayout: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = globalData.backgroundColor
        // Do any additional setup after loading the view.
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        myCollectionLayout.collectionViewLayout = layout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return missingKids.count
    }
    
    //Populate the image views in the cells. Set values on each of the buttons
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = UIImage(named: missingKids[indexPath.row] + ".jpg")
        
        cell.childSelectionButton.tag = indexPath.row
        cell.childSelectionButton.addTarget(self, action: #selector(childDetails(_:)), for: .touchUpInside)
        
        return cell
    }
    //Function to trigger seque into details of child
    func childDetails (_ sender: UIButton){
        globalData.currentAlert = Int(sender.tag)
        globalData.spottedChildName = globalData.missingKids[Int(sender.tag)]
        print("Button Called with tag : " + String(globalData.currentAlert))
        performSegue(withIdentifier: "missingChildDetails", sender: self)
    }
    
    
}
