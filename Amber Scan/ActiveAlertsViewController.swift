//
//  ActiveAlertsViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit

class ActiveAlertsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let missingKids:[String] = [ "Angella Russel", "Elyana Russell", "Elias Russell", "Imahni Russell", "Adrionna Dull", "Robin Strother", "Zhi Ying Zhen", "Earl Wilson", "Tyrese Hill", "Machaela Hardie", "Jeffrey Reynolds",  "Mariamu William",  ]
    let missingSince:[String] = ["Jul 4, 2017", "Jul 4, 2017", "Jul 4, 2017", "Jul 4, 2017","Aug 5, 2017","Aug 8, 2017","Aug 21, 2017","Sep 14, 2017","Sep 19, 2017","Sep 25, 2017","Sep 27, 2017", "Sep 28, 2017"]
    let missingFrom:[String] = ["Washoe Valley, NV", "Washoe Valley, NV", "Washoe Valley, NV", "Washoe Valley, NV","Hohenwald, TN","Kansas City, MO","San Francisco, CA","Dolton, IL","South Holland, IL","Richmond, VA" ,"Columbus, OH" , "Philadelphia, PA"]
    let dob:[String] = ["Jul 27, 2001", "Apr 22, 2004", "Apr 22, 2004","Oct 4, 2007","Nov 10, 2000","Apr 21, 2003","Aug 4, 2001","Oct 3, 2002","Oct 22, 2002","Jul 7, 2001","Oct 7, 2002", "Jul 29, 2001"]
    let ageNow:[String] = ["16", "13", "13", "10","17","14","16","15","15","16","15", "16"]
    let sex:[String] = ["Female", "Female", "Male", "Male","Female","Male","Female","Male","Male","Female","Male", "Female"]
    let race:[String] = ["Biracial", "Biracial", "Biracial", "Biracial","Biracial","Black","Asian","Black","Black","White","White", "Black"]
    let hairColor:[String] = ["Brown", "Brown", "Brown", "Brown","Black","Black","Black","Black","Black","Brown","Brown", "Black"]
    let eyeColor:[String] = ["Brown", "Hazel", "Hazel", "Hazel","Brown","Brown","Black","Brown","Black","Brown","Brown", "Brown"]
    let height:[String] = ["5'4", "5'2", "5'5", "4'0","5'8","5'3","5'4","5'7","5'7","5'5","5'7", "5'1"]
    let weight:[String] = ["120 lbs","100 lbs", "100 lbs", "60 lbs","130","120","150","150","160","200","124", "127"]
    let notes:[String] = ["Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                          "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                          "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                          "Angelina, Elyana, Elias and Imahni may be with their mother. They are biracial. The children are Hispanic and White.",
                          "Adrionna was last seen on August 5, 2017. She is biracial. Adrionna is Black and Hispanic.","",
                          "Zhi Ying may still be in the local area or she may travel to Phoenix, Arizona or El Paso, Texas. She may go by the alias name Jennifer.",
                          "Earl may be in the company of an adult female. They may travel to Chicago, Illinois.",
                          "Tyrese may travel to Harvey, Illinois.",
                          "She may be in the company of her mother. When Machaela was last seen, her hair was dyed red. CAUTION ADVISED: If located, do not approach and immediately contact law enforcement.",
                          "He may still be in the local area or he may travel to Texas.", "Mariamu may still be in the local area or she may travel to Darby, Pennsylvania. She has multiple tattoos"]
    
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
    
    //Populate the views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = UIImage(named: missingKids[indexPath.row] + ".jpg")
        //print(missingKids[indexPath.row] + ".jpg")
        return cell
 
    }
}
