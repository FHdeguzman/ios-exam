//
//  Functions.swift
//  Upraxis
//
//  Created by franz.deguzman on 19/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

func sendAsychronousRequest(urlString : String, params : String, method: String, completion: @escaping (WebReponse)->()) {
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    print(urlString)
    let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    let session = URLSession.shared
    var request = URLRequest(url: url!)
    
    let data = params.data(using: .utf8)!
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = method
    request.httpBody = data
    request.timeoutInterval = 300
    
    session.dataTask(with: request, completionHandler: {
        data, response, err in
            if(data != nil){
                let webResponse = WebReponse()

                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                    if let success = json["success"] as? Bool {
                        print(success)
                        webResponse.success = success
                    }
                    
                    if let payload = json["payload"] as? NSArray {
                        print(payload)
                        webResponse.payloadArray = payload
                    }

                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                completion(webResponse)
            }else{
                completion(WebReponse(success: false))
            }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }).resume()
    
}


func showAlertWithTitle(title: String?, andMessage message: String?, withOkButtonTitle ok: String?, andCancelBurronTitle cancel: String?, completion: @escaping (_ returnAlert: UIAlertController, _ returnAlertButtonIndex:Int) -> Void) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    var buttonIndex = Int()
    
    if(cancel != nil){
        alert.addAction(UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler:  { action in
            buttonIndex = 1
            completion(alert, buttonIndex)
        }))
    }
    
    if(ok != nil ){
        alert.addAction(UIAlertAction(title: ok, style: UIAlertActionStyle.default, handler: { action in
            buttonIndex = 2
            completion(alert, buttonIndex)
        }))
    }
    
    completion(alert, buttonIndex)
}

func computeForAge(birthDateStr: String) -> Int{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    dateFormatter.timeZone = NSTimeZone(name:"UTC")! as TimeZone
    let now = Date()
    let birthdayDate: Date = dateFormatter.date(from:birthDateStr)!
    let calendar = Calendar.current
    
    let ageComponents = calendar.dateComponents([.year], from: birthdayDate, to: now)
    let age = ageComponents.year!
    return age
}
