//
//  ViewController.swift
//  testAppSDKIntegration
//
//  Created by Steven van Stiphout on 15/03/2016.
//  Copyright © 2016 Steven van Stiphout. All rights reserved.
//

import UIKit
import DeltaDNA

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = textField.text
    }
    
    
    //MARK: Actions
    
    @IBAction func setLabelText(sender: UIButton) {
        nameLabel.text = "SDK Started"
        
        
        DDNASDK.sharedInstance().clientVersion = "TestAppSDKIntegration"
        DDNASDK.sharedInstance().startWithEnvironmentKey("22079697190426055695055037414340",
            collectURL: "http://collect4792jmprb.deltadna.net/collect/api",
            engageURL: "http://engage4792jmprb.deltadna.net")

    }
    
    @IBAction func uploadEvents(sender: UIButton) {
        if !DDNASDK.sharedInstance().uploading{
            DDNASDK.sharedInstance().upload()
        }else{
            NSLog("event upload already running, not trying again right now.")
        }
        nameLabel.text = "Event upload initiated"
    }
    @IBAction func newSession(sender: UIButton) {
        nameLabel.text = "Created New Session"
        DDNASDK.sharedInstance().newSession()
        
    }
    
    @IBAction func SendEvent(sender: UIButton) {
        DDNASDK.sharedInstance().recordEventWithName("options", eventParams: [
            "action" : "press button",
            "option" : "SendEvent"
            ])
        nameLabel.text = "Recorded options event"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        
        NSLog("Application Started")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

