//
//  SignUpViewController.swift
//  PitStop
//
//  Created by Moksh Modi on 2/13/20.
//  Copyright © 2020 Moksh Modi. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var Login: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Login(_ sender: Any) {
        //Validate Text Fields
    
        
        //Signing in the User
        let email = self.Login.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = self.Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil
            {
                //Couldn't sign in
                self.ErrorLabel.text = error?.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else
            {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController)
                       as? ViewController
                       
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
