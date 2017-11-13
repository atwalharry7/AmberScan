//
//  SubmissionViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/12/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit

class SubmissionViewController: UIViewController {
    var resultCounter = 0
    
    
    @IBOutlet weak var ROCResults: UITextView!
    
    @IBAction func refreshButton(_ sender: Any) {
        parseResults();
    }
    
    // Do any additional loading you need here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = globalData.backgroundColor
        // Do any additional setup after loading the view.
        if(resultCounter == 0){
            self.ROCResults.text = "Processing"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Take the results from photo submission and display them.
    func parseResults () {
        // While the results have not come in, display message
        if(globalData.submissionResults == ""){
            if(resultCounter == 0) {
                self.ROCResults.text = "Still Processing"
                resultCounter += 1
            }
            else {
                var text = "Processing"
                for _ in 1...resultCounter{
                    text += "."
                }
                self.ROCResults.text = text
                resultCounter += 1
            }
        }
        else{
            self.ROCResults.text = globalData.submissionResults
        }

    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
