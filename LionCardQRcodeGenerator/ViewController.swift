//
//  ViewController.swift
//  LionCardQRcodeGenerator
//
//  Created by Sabin Kim  on 16/02/2017.
//  Copyright © 2017 Sabin Kim . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tfInput: UITextField!
    @IBOutlet var imageDisplay : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func generateQRcode (sender:AnyObject){
        imageDisplay.image = generateQRcodeFromString (string: String)
        
    }
    
    
    
    
    func generateQRcodeFromString(string: String) -> UIImage?{
        let data = string.dataUsingEncoding(String.Encoding.ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10,y: 10)
        
        
        var output = filter?.outputImage?.applying(transform)
        if (output!=nil){
            return UIImage(ciImage: output!)
        }
        return nil;
    }
    
    

}

