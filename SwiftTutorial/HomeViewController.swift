//
//  HomeViewController.swift
//  SwiftTutorial
//
//  Created by Nakama on 26/10/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    public var username: String?
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* A way to hide back button on "show" Segue */
        navigationItem.hidesBackButton = true

        if username != nil {
            usernameLabel?.text = username
        } else {
            usernameLabel.text = "User!"
        }
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
