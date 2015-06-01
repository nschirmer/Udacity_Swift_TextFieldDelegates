//
//  CashTextFieldDelegate.swift
//  TextFieldDelegates Challenge
//
//  Created by Nicholas Schirmer on 6/1/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var cents: Int = 0
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var formatter = NSNumberFormatter()
        
        if string == "" {
            // If string is empty, they must be deleting / backspacing?
            // So let's subtract the last number from cents and pull it back
            let lastDigit = textField.text.substringFromIndex(advance(textField.text.endIndex, -1))
            cents -= lastDigit.toInt()!
            cents /= 10
        } else if let amount = string.toInt() {
            // Make sure they entered a number

            if(amount > 9) {
                // They pasted a number greater than 9; we're not equipped to deal with this yet
                return false
            }
            
            // Shift everything to the left one place and add on the new number
            cents *= 10
            cents += amount
        } else {
            return false
        }
        
        // Set up our number formatter to be USD currency
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        
        // We're displaying in dollars, so divide our cents by 100
        textField.text = formatter.stringFromNumber(Float(cents) / 100)
        
        return false
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        //If they clear the text field, reset it back to the default
        
        textField.text = "$0.00"
        self.cents = 0
        
        return false
    }
}