//
//  ViewController.swift
//  TextFieldDelegates Challenge
//
//  Created by Nicholas Schirmer on 6/1/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var toggledTextField: UITextField!
    @IBOutlet weak var textFieldToggle: UISwitch!
    
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set our delegates
        self.zipCodeTextField.delegate = zipCodeTextFieldDelegate
        self.cashTextField.delegate = cashTextFieldDelegate
        self.toggledTextField.delegate = self
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // Don't allow them to edit unless the toggle is on
        return textFieldToggle.on
    }

    @IBAction func textFieldToggleChange(sender: UISwitch) {
        // If they're currently editing, and the toggle just went off, stop them
        if !textFieldToggle.on && toggledTextField.editing {
            toggledTextField.endEditing(true)
        }
    }
}

