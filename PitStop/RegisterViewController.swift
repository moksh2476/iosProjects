//
//  RegisterViewController.swift
//  PitStop
//
//  Created by Moksh Modi on 2/13/20.
//  Copyright © 2020 Moksh Modi. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var First_Name: UITextField!
    @IBOutlet weak var Last_Name: UITextField!
    @IBOutlet weak var Phone_Number: UITextField!
    @IBOutlet weak var Email_Address: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Re_Password: UITextField!
    @IBOutlet weak var Error_Label: UILabel!
    
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
    
    //Check the fields and validate that the data is correct. If everything is correct,
    func validate() -> String
    {
        //Check that all fields are filled in
        if(First_Name.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || Last_Name.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " "
            || First_Name.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || Phone_Number.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " || Re_Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " ")
        {
            return "Please fill in All_Fields"
        }
        
        return ""
        
    }
    

    @IBAction func Submit_Button(_ sender: Any) {
            //Validate the fields
        let error = validate()
        
        if error != ""
        {
            showError(error)
        }
        else
        {//Create cleaner versions of data
            let firstname = self.First_Name.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = self.Last_Name.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = self.Email_Address.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phone = self.Phone_Number.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Create the User
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //Check for errors
                if err != nil
                {
                    //There was an error in creating this
                    self.showError("Error Creating User")
                    self.Error_Label.text = err?.localizedDescription
                }
                else
                {
                    

                    
                    //User was created successfully, now store the first name and last name and all other fields of user.
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "email_address" : email,
                        "first_name" : firstname,
                        "last_name" : lastname,
                        "password" : password,
                        "phone_number" : phone,
                        "uid" : result!.user.uid]) { (error) in
                            if error != nil {
                                //Show error message
                                self.showError("Error saving user data")
                            }
                    }
                    //transition to the home screen
                    self.transitiontoHome()
                }
            }
           
            
        }
    }
    
    func transitiontoHome()
    {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController)
        as? ViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message: String)
    {
        Error_Label.text = "error!"
        Error_Label.alpha = 1
    }
    
}
