//
//  TakeAPicViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit
import Alamofire


class TakeAPicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var name_spotting  : String = String()
    var street_spotting  : String = String()
    var city_spotting  : String = String()
    var zipcode_spotting  : String = String()
    var contact_spotting  : String = String()
    
    @IBOutlet var pickedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //self.view endEditing:YES;
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonAction(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func photoLibraryAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
    }
    
    
    @IBOutlet var s_Street: UITextField!
    @IBOutlet var s_Name: UITextField!
    @IBOutlet var s_City: UITextField!
    @IBOutlet var s_Zip: UITextField!
    @IBOutlet var s_ContactNumber: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!)
    {
        pickedImage.image = image
        self.dismiss(animated: true, completion: nil);
    }

}
