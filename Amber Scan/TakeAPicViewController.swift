//
//  TakeAPicViewController.swift
//  Amber Scan
//
//  Created by Harry Atwal on 4/6/17.
//  Copyright © 2017 Harry Atwal. All rights reserved.
//

import UIKit
import Alamofire


class TakeAPicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var pickedImage: UIImageView!
    @IBOutlet var displaySpotting: UILabel!
    @IBOutlet weak var uploadStatus: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = globalData.backgroundColor
        //self.view endEditing:YES;
        // Do any additional setup after loading the view, typically from a nib.
        displaySpotting.text = "Id: " + globalData.spottingId
        uploadStatus.progress = 0.0
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
        let imageData = UIImagePNGRepresentation(pickedImage.image!)
        //let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!)
    {
        pickedImage.image = image
        self.dismiss(animated: true, completion: nil);
    }

    @IBAction func submitSpotting(_ sender: Any) {
        
        guard let submissionVar = pickedImage.image else {
            return
        }
        //let submissionVar = pickedImage.image!
        submitImage(subImage: submissionVar, imageID: globalData.spottingId, callback: { str in
            print(str)
            self.performSegue(withIdentifier: "submitImage", sender: self)
        })
        

    }
    
    // Uploads image to server and updates the upload bar in this method.
    func submitImage (subImage: UIImage, imageID: String, callback: @escaping (String) -> Void )
    {
        print("AlamoFire submit Image called")
        print("\n -------------------------------- \n")
    
        let submissionURL = globalData.apiAddress + "/api/upload"
        let imageName = globalData.spottingId.description + ".png"
        //Convert name to type data
        let imageNameData = imageName.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        let image = UIImagePNGRepresentation(subImage)
        
        //Create Multipart form with image
        Alamofire.upload(
            multipartFormData:{ multipartFormData in
                //Add the image to the form last. Image name must have extension
                multipartFormData.append(imageNameData, withName: "imageName" )
                multipartFormData.append(image!, withName: "image", fileName: imageName, mimeType: "image/png")
        },
            to: submissionURL,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        //to get JSON return value
                        if let result = response.result.value {
                            let JSON = result as! [String: Any?]
                            print("JSON Response")
                            globalData.rocResults = self.prettyPrint(with: JSON)
                            print(globalData.rocResults)
                        }
                    }
                    // Update Progress bar
                    upload.uploadProgress { progress in
                        print("Uploading Percentage \(progress.fractionCompleted)")
                        //Code for updating progress bar.
                        self.uploadStatus.progress = Float(progress.fractionCompleted)
                        if(progress.fractionCompleted == 1.0){
                            callback(String(progress.fractionCompleted))
                        }
                    }
                case .failure(let encodingError):
                    print("\nError 8: The request is: \n")
                    print(encodingError)
                
                }
            }
        )
    }
    
    
    func prettyPrint(with json: [String:Any]) -> String{
        let data = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        return string as! String
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
