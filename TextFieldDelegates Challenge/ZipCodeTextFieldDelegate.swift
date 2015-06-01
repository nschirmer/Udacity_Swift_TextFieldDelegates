//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldDelegates Challenge
//
//  Created by Nicholas Schirmer on 6/1/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        if let number = string.toInt() {
            // They entered a number
            
            var newZip: NSString = textField.text
            newZip = newZip.stringByReplacingCharactersInRange(range, withString: string)
            
            return newZip.length <= 5 //Only allow entry if new zip is 5 digits or less
        } else {
            return string == "" // Allow them to backspace, but nothing else
        }
    }
}