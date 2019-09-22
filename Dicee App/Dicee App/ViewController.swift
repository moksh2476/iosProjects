//
//  ViewController.swift
//  Dicee App
//
//  Created by Moksh Modi on 6/3/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0;
    var randomDiceIndex2: Int = 0;
    
    
    @IBOutlet weak var diceimageview1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonPressed(_ sender: Any)
    {
        updateDice();
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice();
    }

    func updateDice()
    {
        //This will get executed when the button gets pressed
        randomDiceIndex1 = Int.random(in: 0...5) + 1
        randomDiceIndex2 = Int.random(in: 0...5) + 1
        //makes the image randomized
        diceimageview1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\( randomDiceIndex2)")
    }
}

