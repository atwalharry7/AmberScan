//
//  MainViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //sleep(1)
        showNavController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showNavController()
    {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }
    
    
}
