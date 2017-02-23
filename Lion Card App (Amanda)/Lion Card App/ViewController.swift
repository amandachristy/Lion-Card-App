//
//  ViewController.swift
//  Lion Card App
//
//  Created by Amanda Christy on 1/24/17.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

/*import UIKit
class ViewConroller: UIViewController {

func generateQRCode(from string: String) -> UIImage? {
    let data = string.data(using: String.Encoding.ascii)
    
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        
        if let output = filter.outputImage?.applying(transform) {
            return UIImage(ciImage: output)
        }
    }
    
    return nil
}



}



*/
 import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tfInput: UITextField!
    @IBOutlet var imageDisplay: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    
    
    }
    
    
    
    @IBAction func Barcode(sender: AnyObject){
        imageDisplay.image = generateBarcodeFromString(string: tfInput.text!)
    }
    
    func generateBarcodeFromString(string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let output = filter?.outputImage?.applying(transform)
        if (output != nil) {
            return UIImage(ciImage: output!)
        }
        return nil;
        }
}



