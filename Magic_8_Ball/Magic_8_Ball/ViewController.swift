//
//  ViewController.swift
//  Magic_8_Ball
//
//  Created by Moksh Modi on 6/3/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballname: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button(_ sender: UIButton) {
        changeimage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeimage()
    }
    
    func changeimage()
    {
        let imagenum: Int = Int.random(in: 1...5)
        ballname.image = UIImage(named: "ball\(imagenum)")
    }
}

