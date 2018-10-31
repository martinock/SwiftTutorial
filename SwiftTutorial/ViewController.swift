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
        /** Navigate programatically
         * NOTE: Set id to segue first
         */
        // performSegue(withIdentifier: "signUpSegue", sender: self)
    }

    @IBAction func onLogin(_ sender: Any) {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username != "", password != "" {
                
                if let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    homeViewController.username = usernameTextField.text
                    if let navigator = navigationController {
                        navigator.pushViewController(homeViewController, animated: true)
                        /* Show without segue */
//                        self.navigationController?.pushViewController(homeViewController, animated: true)
                        
                        /* Present without segue */
                        //                self.present(homeViewController, animated: true, completion: nil)
                        
                        /* Embed VC to UI Navigation Controller programmatically */
                        //                let navigationController = UINavigationController(navigationController, animated: true)
                    }
                }
            } else {
                titleLabel.text = "Hello, anonymous!"
            }
            
        } else {
            titleLabel.text = "Hello, anonymous!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? HomeViewController {
            viewController.username = usernameTextField.text
        }
    }
    
    /**
     * A callback function before a segue is performed
     *
     * NOTE: can be used for validation like this
     * Don't forget to add identifier to segue
     * This will affect every segue, so please insert every segue connected with this View Controller
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "HomeSegue" {
            if let username = usernameTextField.text, let password = passwordTextField.text {
                if username != "", password != "" {
                    return true
                } else {
                    return false
                }
                
            } else {
                return false
            }
        }
        
        if identifier == "signBarSegue" {
            return true
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func labelTapGesture(_ sender: Any) {
        print("Label Tapped")
    }
    
}

