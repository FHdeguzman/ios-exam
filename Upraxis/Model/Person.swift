//
//  Person.swift
//  Upraxis
//
//  Created by franz.deguzman on 18/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation

class Person : NSObject, NSCoding{
    
    var id = String()
    var firstName = String()
    var lastName = String()
    var birthDate = String()
    var email = String()
    var mobileNo = String()
    var address = String()
    var contactPerson = ContactPerson()
    

    override init(){
        self.id = String()
        self.firstName = String()
        self.lastName = String()
        self.birthDate = String()
        self.email = String()
        self.mobileNo = String()
        self.address = String()
        self.contactPerson = ContactPerson()
    }
    
    init(id : String, firstName : String, lastName : String, birthDate : String, email  : String, mobileNo : String, address : String, contactPerson : ContactPerson){
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.email = email
        self.mobileNo = mobileNo
        self.address = address
        self.contactPerson = contactPerson
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let  id = aDecoder.decodeObject(forKey: "id") as! String
        let  firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        let  lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        let  birthDate = aDecoder.decodeObject(forKey: "birthDate") as! String
        let  email = aDecoder.decodeObject(forKey: "email") as! String
        let  mobileNo = aDecoder.decodeObject(forKey: "mobileNo") as! String
        let  address = aDecoder.decodeObject(forKey: "address") as! String
        let  contactPerson = aDecoder.decodeObject(forKey: "contactPerson") as! ContactPerson
        
        self.init(id : id, firstName  : firstName, lastName : lastName, birthDate : birthDate, email  : email, mobileNo  :mobileNo, address  : address, contactPerson : contactPerson)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(birthDate, forKey: "birthDate")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(mobileNo, forKey: "mobileNo")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(contactPerson, forKey: "contactPerson")
    }
    
}
