//
//  ViewController.swift
//  Another-Music-Player
//
//  Created by Tommie on 3/22/17.
//  Copyright © 2017 Watchanan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let genPassword  = arc4random_uniform(9999) + 1;
        UserDefaults.standard.set(genPassword, forKey: "password")
        passwordLabel.text = String(genPassword);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PressLogin(_ sender: Any) {
        let a:Int? = Int(inputPassword.text!)
        let b:Int? = Int(passwordLabel.text!)
        if a == b {
            performSegue(withIdentifier: "ListSegueIdentifier", sender: self)
        }
        else {
            viewDidLoad()
        }
    }

}

