//
//  ViewController.swift
//  Example
//
//  Created by Alexander Schuch on 25/01/15.
//  Copyright (c) 2015 Alexander Schuch. All rights reserved.
//

import UIKit
import QRCode

class ViewController: UIViewController {

   
    @IBOutlet weak var imageViewLarge: UIImageView!
    @IBOutlet weak var btnAction: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // large
        // default
        imageViewLarge.image = {
            var qrCode = QRCode("http://github.com/aschuch/QRCode")!
            qrCode.size = self.imageViewLarge.bounds.size
            qrCode.errorCorrection = .High
            return qrCode.image
        }()
        
        
        
           }
    
  


}
