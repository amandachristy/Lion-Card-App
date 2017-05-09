//
//  SignInViewController.swift
//  s
//
//  Created by Sabin Kim  on 09/05/2017.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//
import UIKit

/*
 
 A view controller for the sign in view
 
 */
class SignInViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* preset the username and password based on the stored credentials -- obviously this would be removed from a production app -- but it makes it way easier to test right now! */
        self.username.text = self.app.credentials!["sampleUsername"]
        self.password.text = self.app.credentials!["samplePassword"]
    }
    
    /* Handle the signIn button action */
    @IBAction func signIn(_ sender: Any) {
        
        /* start animating the activity indicatior, so the user doesn't think the app is frozen */
        self.activityIndicator.startAnimating()
        
        /* a responsible event handler would test to see if username and password existed before using them. oh well! */
        self.app.api!.loginAuthenticate(username: self.username.text!, password: self.password.text!, completion: {(json: [String: Any]) -> Void in
            self.app.user = User(data: json)
            
            /* we've processed the response, so we can disable the activity indicator */
            self.activityIndicator.stopAnimating()
            
            if (self.app.userReady) {
                /* we have a user, so switch to the user view to show their info */
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "ShowUserView", sender: sender)
                }
            } else {
                /* we don't have a user, so show an alert describing the problem */
                let alert = UIAlertController(title: "Error", message: "Unknown user/password.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
