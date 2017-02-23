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
    @IBAction func generateBarcode (sender:AnyObject){
        imageDisplay.image = generateBarcodeFromString ( string: (arc4random_uniform(1001)))
        
    }
    
    
    
    
 
    
    func generateBarcodeFromString(string: String) -> UIImage?{
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10,y: 10)
        
        
        let output = filter?.outputImage?.applying(transform)
        //if (output!==nil){
        return UIImage(ciImage: output!)
        //}
        //return nil;
    }

}

