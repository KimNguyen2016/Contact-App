//
//  ViewController.swift
//  Contact Information App
//
//  Created by Kim Nguyen on 2016-09-10.
//  Copyright © 2016 Kim Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var ageField: UITextField!

    var myContact: Contact?
    
    var path: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        path = fileInDocumentsDirectory("contact.plist") as String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addContactButton(sender: AnyObject) {
        
        
        if let contact = createContactFromUI() {
            print("Valid contact: \(contact)")
        }
        else{
            print("Error Invalid Contact")
        }
        
    }
    
    func createContactFromUI() -> Contact? {
        var contact: Contact? = nil
        
        if !(firstNameField.text?.isEmpty)! {
            
            if !(lastNameField.text?.isEmpty)!{
                
                if !(emailField.text?.isEmpty)!{
                    
                    if !(phoneField.text?.isEmpty)! {
                        
                        let numberFormatter = NSNumberFormatter()
                        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                        
                        if let age = numberFormatter.numberFromString(ageField.text!)?.integerValue {
                        
                            contact = Contact(firstName: firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, phone: phoneField.text!, age: age)
                            
                        } else {
                            //
                            
                        }
                    }
                }
            }
        }
        
        return contact
    }

    @IBAction func clearButton(sender: AnyObject) {
        
        firstNameField.text = ""
        lastNameField.text = ""
        emailField.text = ""
        phoneField.text = ""
        ageField.text = ""
        
        
    }
    
    func documentsDirectory() -> String{
        
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        
        return documentsFolderPath
        
    }
    
    func fileInDocumentsDirectory(filename: String) -> NSString {
        
        return (documentsDirectory() as NSString).stringByAppendingPathComponent(filename)
    }
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        print("save: \(path)")
        
        var success = false
     
  
        if let contact = myContact {
            
            print("test: \(success)")
            
            success = NSKeyedArchiver.archiveRootObject(contact, toFile:path)
            
        
            if (success) {
                
                
                
                print("Save succesfully")
                
            } else {
                
                print("Error Saving data file")
            }
        }
        else {
            print("what happening ??? ")
        }
    }
    
    @IBAction func loadButton(sender: AnyObject) {
        
        if let contact = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! Contact? {
            //add to UI
            
            firstNameField.text = contact.firstName
            lastNameField.text = contact.lastName
            emailField.text = contact.email
            phoneField.text = contact.phone
            ageField.text = String(contact.age)
            
        }
        
        
    }
}

