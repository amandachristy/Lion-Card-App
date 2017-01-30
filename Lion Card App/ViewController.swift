//
//  ViewController.swift
//  Lion Card App
//
//  Created by Amanda Christy on 1/24/17.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var qrcodeImage: CIImage!

    
    

    @IBOutlet weak var imgQRCode: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var textField: UITextField!
  
   
    @IBAction func performButtonAction(sender: AnyObject){
        if qrcodeImage == nil {
            if textField.text == "" {
                
            
            
            let data = textField.text?.data (using: String.Encoding.isoLatin1, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter?.setValue(data, forKey: "inputMessage")
            filter?.setValue("Q", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter?.outputImage
            
            imgQRCode.image = UIImage(ciImage: qrcodeImage)
            
            textField.resignFirstResponder()
            
            btnAction.setTitle("Clear", for: UIControlState.normal)
        }
        else {
            imgQRCode.image = nil
            qrcodeImage = nil
            btnAction.setTitle("Generate", for: UIControlState.normal)
        }
            return
    }
    }
    



    @IBAction func changeImageViewScale(sender: AnyObject){
        
    }


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

