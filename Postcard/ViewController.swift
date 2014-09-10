//
//  ViewController.swift
//  Postcard
//
//  Created by Kenneth Wilcox on 9/9/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var enterNameTextField: UITextField!
  @IBOutlet weak var enterAMessageTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    messageLabel.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func sendMailButtonPressed(sender: UIButton) {
    messageLabel.text = enterAMessageTextField.text
    messageLabel.hidden = false
    
  }
}

