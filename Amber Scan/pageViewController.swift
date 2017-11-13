//
//  PageContentViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 10/29/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import Foundation
import UIKit



class pageViewController: UIViewController {
    
    
    @IBAction func rankOneResults(_ sender: Any) {
        let myView = self.storyboard?.instantiateViewController(withIdentifier: "rankone")
        self.present(myView!, animated: false, completion: nil)
        
    }
    
    @IBAction func svmResults(_ sender: Any) {
        let myView = self.storyboard?.instantiateViewController(withIdentifier: "svn")
        self.present(myView!, animated: false, completion: nil)
    }

    @IBAction func customResults(_ sender: Any) {
        let myView = self.storyboard?.instantiateViewController(withIdentifier: "custom")
        self.present(myView!, animated: false, completion: nil)
    }
    
    
    //How to do an alert
    func alertUserPrompt () {
        let alert = UIAlertController(title: "Alert", message: "This is a sample alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //Text Field to display contents of the API Packet
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseResult()
        
    }
    
    //Method that will take the string returned from a submission and parse it for use in various views
    func parseResult(){
        //let resultsData = globalData.submissionResults
        var resultsData = "['openBR,CS0741_007f11.jpg , 40.4140961371,CS0857_399f10.jpg , 40.4155522573,CS0026_218f10.jpg , 40.4159954241,Rank One,CS0222_118f15.jpg , 0.592911601067,CS0222_225f15.jpg , 0.584863781929,CS0811_337f14.jpg , 0.579551815987']"
        
        //Remove the leading and trailing brackets to parse out the csv
        //var r1 = resultsData.sub
        //var results1 = resultsData.substringWithRange(Range<String.Index>(start: resultsData.startIndex, end: resultsData.endIndex))
        //print (results1)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
