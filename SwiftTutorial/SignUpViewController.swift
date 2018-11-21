//
//  SignUpViewController.swift
//  SwiftTutorial
//
//  Created by Nakama on 26/10/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
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
    
    // NOTE: Sending post request and handle the success and failure
    @IBAction func onSubmit(_ sender: Any) {
        Alamofire
            .request(URL(string: "http://93.188.167.250:8080/login")!,
                          method: .post,
                          parameters: [
                            "name": usernameTextField.text ?? "",
                            "email": emailTextField.text ?? "",
                            "password": passwordTextField.text ?? ""
                        ],
                          encoding: JSONEncoding.default)
            .responseJSON{(response) in
                switch response.result {
                //NOTE: Success handler
                case .success(_):
                    //NOTE: A way to store data locally (Same as SharedPreference in Android)
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(true, forKey: "isLogin")

                    //NOTE: set the initial view into home screen (home screen not implemented)
//                    let window = UIApplication.shared.keyWindow
//                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                    let secondVC = storyBoard.instantiateViewController(withIdentifier: "listIdentifier")
//                    window?.rootViewController = secondVC
                    
                    break;
                //NOTE: Error handler
                case .failure(let error):
                    var messageError = "Failure"
                    //NOTE: how to get error code
                    if error._code == NSURLErrorNotConnectedToInternet {
                        messageError = "Tidak ada koneksi internet"
                    }
                    let alert = UIAlertController(title: "Failure", message: messageError, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                        _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
                    break;
                }
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
