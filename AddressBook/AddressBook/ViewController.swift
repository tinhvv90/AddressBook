//
//  ViewController.swift
//  AddressBook
//
//  Created by Tinh on 3/7/16.
//  Copyright © 2016 Seven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configueStartButton()
    }
    
    func configueStartButton() {
        startButton.roundBorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

