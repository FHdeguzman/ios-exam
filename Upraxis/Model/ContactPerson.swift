//
//  ContactPerson.swift
//  Upraxis
//
//  Created by franz.deguzman on 19/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation


class ContactPerson : NSObject, NSCoding{

    
    var name = String()
    var mobileNo = String()
    
    
    override init(){
        self.name = String()
        self.mobileNo = String()
    }
    
    init(name : String, mobileNo : String){
        self.name = name
        self.mobileNo = mobileNo
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let  name = aDecoder.decodeObject(forKey: "name") as! String
        let  mobileNo = aDecoder.decodeObject(forKey: "mobileNo") as! String
        
        self.init(name : name, mobileNo : mobileNo)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(mobileNo, forKey: "mobileNo")
    }
    
}
