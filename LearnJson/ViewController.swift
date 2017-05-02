//
//  ViewController.swift
//  LearnJson
//
//  Created by ANKIT SHARMA on 09/04/17.
//  Copyright © 2017 ANKIT SHARMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://httpbin.org/get?color=red&shape=oval")
        let urlRequest = URLRequest(url: url! as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler:{(data,response,error) in
        
        if error != nil
        {
          print(error!)
        }
        else
        {
            if let urlContent = data
            {

             do
             {
        
            let jsonResults = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(jsonResults)

            }
                
             catch
             {
                
                print("JSON Parse Failed")
                
                }

            }
          }
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

