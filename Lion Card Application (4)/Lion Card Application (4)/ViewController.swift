//
//  ViewController.swift
//  Lion Card Application (4)
//
//  Created by Sabin Kim  on 13/04/2017.
//  Copyright © 2017 Sabin Kim . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
       
        let task = session.dataTask(with: urlRequest)
            
            { (data, response, error) in
        
            if let response = response {
                print(response)
            }
            if let error = error {
                print(error)
            
            }
            }
        task.resume()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
