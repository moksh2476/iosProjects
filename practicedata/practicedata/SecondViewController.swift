//
//  SecondViewController.swift
//  practicedata
//
//  Created by Moksh Modi on 7/19/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import UIKit
protocol CanRecieve
{
    func dataRecieved(data: String)
}
class SecondViewController: UIViewController {
    var data = ""
    var delegate : CanRecieve?
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func button_pressed(_ sender: Any) {
       delegate?.dataRecieved(data: textField.text!)
       dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
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
