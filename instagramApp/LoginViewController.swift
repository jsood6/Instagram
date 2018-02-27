//
//  LoginViewController.swift
//  instagramApp
//
//  Created by jsood on 2/25/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

import UIKit
import Parse
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet var bigView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.red)

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error:Error?) -> Void in
            if user != nil {
                print("you are logged in!")
            }
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground{ (success:Bool, error:Error?) -> Void in
                if success{
                    print("yay created a user!")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                } else{
                    print(error?.localizedDescription)
                    if error?._code == 202{
                        print("Username is taken")
                    }
                }
            }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
