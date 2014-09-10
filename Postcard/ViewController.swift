//
//  ViewController.swift
//  Postcard
//
//  Created by Kenneth Wilcox on 9/9/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var enterNameTextField: UITextField!
  @IBOutlet weak var enterAMessageTextField: UITextField!
  @IBOutlet weak var sendMailButton: UIButton!
  
  var mailer: MFMailComposeViewController
  
  required init(coder aDecoder: NSCoder) {
    //fatalError("init(coder:) has not been implemented")
    
    // Getting property not initialized at super.init call...
    mailer = MFMailComposeViewController()
    // don't have self yet...
    super.init(coder: aDecoder)
  }
  
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
  
  func sendEmal(sendToEmail:String) {
    if (MFMailComposeViewController.canSendMail()) {
      //self.mailer = MFMailComposeViewController()
      self.mailer.mailComposeDelegate = self
      self.mailer.setSubject("Barcelona Greetings")
      self.mailer.setMessageBody(enterAMessageTextField.text, isHTML: false)
      var toRecipients = [String]()// = [sendToEmail, "noone@example.com"]
      toRecipients.append(sendToEmail)
      self.mailer.setToRecipients(toRecipients)
      
      // iPad?
//      mailer.modalPresentationStyle = UIModalPresentationStyle.PageSheet
      self.presentViewController(self.mailer, animated: true, completion: nil)
    }
    else {
      //UIAlertView alert = deprecated
      var alert = UIAlertController(title: "Failure", message: "Your device doesn't support the composure sheet", preferredStyle: .Alert)
      // Don't forget to add an action - you'll get a non dismissable modal dialog - dooh
      alert.addAction(UIAlertAction(title: "Drats", style: .Default, handler: nil))
      // to handle actions change the handler: nil above to something like this
      // { action in switch action.style { case .Default:}}
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }

  func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
    var action = "Mail Sent!"
    switch result.value {
    case MFMailComposeResultCancelled.value:
      action = "Mail Canceled"
    case MFMailComposeResultSaved.value:
      action = "Mail Saved"
//    case MFMailComposeResultSent.value:
//      action = "Mail Sent!"
    case MFMailComposeResultFailed.value:
      action = "Mail Failed"
    default:
      break
    }
    self.dismissViewControllerAnimated(false, completion: nil)
    sendMailButton.setTitle(action, forState: .Normal)
  }
  
  @IBAction func sendMailButtonPressed(sender: UIButton) {
    messageLabel.text = enterAMessageTextField.text
    messageLabel.hidden = false
    enterAMessageTextField.text = ""
    enterAMessageTextField.resignFirstResponder()
    messageLabel.textColor = UIColor.redColor()
    //sendMailButton.setTitle("Mail Sent!", forState: UIControlState.Normal)
    sendMailButton.backgroundColor = UIColor.greenColor()
    
    nameLabel.hidden = false;
    nameLabel.text = enterNameTextField.text
    nameLabel.textColor = UIColor.blueColor()
    enterNameTextField.text = ""
    nameLabel.resignFirstResponder()
    
    self.sendEmal(nameLabel.text!)
  }
}

