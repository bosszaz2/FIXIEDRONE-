//
//  droneViewController.swift
//  FIXIEDRONE2
//
//  Created by Jirayu Promsongwong on 11/14/2559 BE.
//  Copyright © 2559 KMITL. All rights reserved.
//

import UIKit

class droneViewController: UIViewController {

    @IBOutlet weak var letFlyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func letFlyAction(_ sender: Any) {
        let scriptUrl = "http://161.246.92.153:5000/"
        let url = URL(string: scriptUrl)
        let task = URLSession.shared.dataTask(with: url!) { (data, response ,error ) in
            
            
            if let data = data,
                let html = String(data: data,encoding: String.Encoding.utf8) {
                
                print(html)
                
            }
        }
        
        task.resume()
        
    }
    
}
