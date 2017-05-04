//
//  ViewController.swift
//  New Lion Card App
//
//  Created by Sabin Kim  on 20/04/2017.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var OutputText: UITextView!
    @IBOutlet var _username: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _login_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func login() {
        
        
        let parameters = [
            "email": username, //email
            "password": password //password
        
        ]
        let timestamp
        
      
        
        var statusCode: Int = 0
        Alamofire.request(.POST, "https://test.campuscardcenter.com/cs/api/globalLoginValidate", parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                statusCode = (response.response?.statusCode)! //Gets HTTP status code, useful for debugging
                if let value: AnyObject = response.result.value {
                    //Handle the results as JSON
                    let post = JSON(value)
                    if let key = post["session_id"].string {
                        //At this point the user should have authenticated, store the session id and use it as you wish
                    } else {
                        print("error detected")
                    }
                }
        }
   
    
    Alamofire
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
        
        
    
