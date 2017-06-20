//
//  WebResponse.swift
//  Upraxis
//
//  Created by franz.deguzman on 19/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation

class WebReponse : NSObject{
    
    var success = Bool()
    var payloadArray = NSArray()
    
    override init(){
        self.success = Bool()
        self.payloadArray = NSArray()
    }
    
    init(success : Bool){
        self.success = success
    }
}
