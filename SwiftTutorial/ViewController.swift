//
//  ViewController.swift
//  SwiftTutorial
//
//  Created by Nakama on 17/10/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        titleLabel.text = "Success"
    }

    @IBAction func onLogin(_ sender: Any) {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username != "", password != "" {
                titleLabel.text = "Hello, " + username + "!"
            } else {
                titleLabel.text = "Hello, anonymous!"
            }
            
        } else {
            titleLabel.text = "Hello, anonymous!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func labelTapGesture(_ sender: Any) {
        print("Label Tapped")
    }
    
}

