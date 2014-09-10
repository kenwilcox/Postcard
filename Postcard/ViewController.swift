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
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var enterNameTextField: UITextField!
  @IBOutlet weak var enterAMessageTextField: UITextField!
  @IBOutlet weak var sendMailButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    messageLabel.hidden = true
    nameLabel.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  @IBAction func sendMailButtonPressed(sender: UIButton) {
    messageLabel.text = enterAMessageTextField.text
    messageLabel.hidden = false
    enterAMessageTextField.text = ""
    enterAMessageTextField.resignFirstResponder()
    messageLabel.textColor = UIColor.redColor()
    sendMailButton.setTitle("Mail Sent!", forState: UIControlState.Normal)
    sendMailButton.backgroundColor = UIColor.greenColor()
    
    nameLabel.hidden = false;
    nameLabel.text = enterNameTextField.text
    nameLabel.textColor = UIColor.blueColor()
    enterNameTextField.text = ""
    nameLabel.resignFirstResponder()
  }
}

