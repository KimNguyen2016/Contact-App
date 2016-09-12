//
//  Contact.swift
//  Contact Information App
//
//  Created by Kim Nguyen on 2016-09-10.
//  Copyright © 2016 Kim Nguyen. All rights reserved.
//

import UIKit

class Contact: NSObject, NSCoding {
    
    //properties
    
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var age: Int
    
    //Initializer
    init(firstName: String, lastName: String, email: String, phone: String, age: Int) {
     
        // set all properties to default values or passed in values
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.age = age
        
    }
    
    override var description: String{
        
        return "first: \(firstName) \(lastName) \(email) \(phone) \(age)"
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
        self.email = aDecoder.decodeObjectForKey("email") as! String
        self.phone = aDecoder.decodeObjectForKey("phone") as! String
        self.age = aDecoder.decodeIntegerForKey("age") as Int
        
        super.init()
    }
    
    func encodeWithCoder(enCoder: NSCoder) {
        
        enCoder.encodeObject(firstName, forKey: "firstName")
        enCoder.encodeObject(lastName, forKey: "lastName")
        enCoder.encodeObject(email, forKey: "email")
        enCoder.encodeObject(phone, forKey: "phone")
        enCoder.encodeObject(age, forKey: "age")
        
    }

}
