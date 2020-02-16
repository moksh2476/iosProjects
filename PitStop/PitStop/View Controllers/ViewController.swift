//
//  ViewController.swift
//  PitStop
//
//  Created by Moksh Modi on 12/25/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var state: UIPickerView!
    @IBOutlet weak var city: UIPickerView!
    
    var pickerData: [String] = [String] ()
    let listOfStates : [String] = [String] ()
    let listOfCities : [String] = [String] ()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = self
   pickerData = ["Tire Replacement", "Replace Battery", "Dim Lights", "Tow", "Lockout", "Fuel Delievery", "Others"]
    
    }
    // Number of columns of data
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       // The number of rows of data
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if pickerView == picker
           {
                return pickerData.count
           }
        else if pickerView == state
        {
            return listOfStates.count
        }
        else if pickerView == city
           {
            return listOfCities.count
        }
       }
       
       // The data to return for the row and component (column) that's being passed in
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerData[row]
       }
    


}

