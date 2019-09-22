//
//  ViewController.swift
//  practicedata
//
//  Created by Moksh Modi on 7/19/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanRecieve {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var text: UITextField!
    
 
    @IBAction func Button_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "changeToSecondView", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeToSecondView"
        {
            let secondVC = segue.destination as! SecondViewController
            secondVC.data = text.text!
            secondVC.delegate = self
        }
    }
    
    func dataRecieved(data: String) {
        label.text = data
    }


}

