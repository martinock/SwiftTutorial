//
//  SignUpViewController.swift
//  SwiftTutorial
//
//  Created by Nakama on 26/10/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        /* Pop stack programatically for "show" Segue */
//        self.navigationController?.popViewController(animated: true)
        
        /* Dismiss "present modally" segue */
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
