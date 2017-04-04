//
//  ViewController.swift
//  New Lion Card App
//
//  Created by Amanda Christy on 2/23/17.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var _username: UITextField!
    @IBOutlet var _password: UITextField!
    @IBOutlet var _login_button: UIButton!
    
    private var preferences = UserDefaults.standard

    override func viewDidLoad() {
        
        if(preferences.object(forKey: "session") != nil){
            LoginDone()
        }
        else{
            LoginToDo()
        }
        
       
    }
    


    @IBAction func LoginAction(_ sender: Any) {
        
        if(_login_button.titleLabel?.text == "Logout")
        {
            preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
            return
        }
        
        let username = _username.text
        let password = _password.text

        
        if(username == "" || password == "")
        {
            return
        }
        DoLogin(username!, password!)
    }
    
    
    func DoLogin(_ user:String, _ psw:String)
    {
        let session_data = "{" +
        "\"firstName\" : \"Keri A.\"," +
        "\"lastName\" : \"Card\"," +
        "\"cardholderId\" : \"1\"," +
        "\"activeCardNumber\" : \"6565440000000010\"," +
        "\"IssuerID\": \"123\"," +
        "\"mobileURL\":\" https://dev.campuscardcenter.com/m\"," +
        "\"accounts\" :\" [ {{\"'" +
        "\"account\" : \"{" +
        "\"plan\" : \"Campus Cash\"," +
        "\"type\" : \"PTS\"," +
        "\"balance\" : \"11.12\"," +
        "\"} } ]\"," +
        "\"success\" : \"true\"," +
        "}";

        /*
         let url = URL(string: "https://test.campuscardcenter.com/cs/api/globalLoginValidate" )

 
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url:url!)
        request.httpMethod = "POST"
        
        let paramToSend = "username" + user + "&password=" + psw
        
       request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            guard let _:Data = data else
            {
                return
            }
            
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            
            if let data_block = server_response["data"] as? NSDictionary
            {
                if let session_data = data_block["session"] as? String
                {*/
                    preferences.set(session_data, forKey: "session")

                    DispatchQueue.main.async(execute: self.LoginDone)
                /*}
            }
            
            
            
        })
         task.resume()
        */
        
        
    }
    
    
    
   
    func LoginToDo()
    {
        _username.isEnabled = true
        _password.isEnabled = true
        
        _login_button.isEnabled = true
        
        
        _login_button.setTitle("Login", for: .normal)
}
    
    func LoginDone()
    {
        
        _username.isEnabled = false
        _password.isEnabled = false
        
        _login_button.isEnabled = true
        
        
        _login_button.setTitle("Logout", for: .normal)
    }
    
}
