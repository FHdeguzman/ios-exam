//
//  PersonDetailViewController.swift
//  Upraxis
//
//  Created by franz.deguzman on 18/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var selectedPerson = Person()

    @IBOutlet var personDetailsFrame: UIView!
    @IBOutlet var contactPersonFrame: UIView!
    
    
    @IBOutlet var address: UILabel!
    @IBOutlet var mobilenumber: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var birthday: UILabel!
    @IBOutlet var name: UILabel!
    
    
    @IBOutlet var contactPersonName: UILabel!
    @IBOutlet var contactPersonNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personDetailsFrame.layer.borderWidth = 1
        personDetailsFrame.layer.borderColor = Color.primaryColor.cgColor
        personDetailsFrame.layer.cornerRadius = 3
        
        contactPersonFrame.layer.borderWidth = 1
        contactPersonFrame.layer.borderColor = Color.primaryColor.cgColor
        contactPersonFrame.layer.cornerRadius = 3
        
        name.text = "\(selectedPerson.firstName) \(selectedPerson.lastName)"
        birthday.text = "Birthdate: \(selectedPerson.birthDate)"
        email.text = "Email Address: \(selectedPerson.email)"
        mobilenumber.text = "ContactNumber: \(selectedPerson.mobileNo)"
        address.text = "Address: \(selectedPerson.address)"
        
        contactPersonName.text = "Name: \(selectedPerson.contactPerson.name)"
        contactPersonNumber.text = "Contact Number: \(selectedPerson.contactPerson.mobileNo)"
        

        age.text = "Age: \(computeForAge(birthDateStr: selectedPerson.birthDate))"
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "upraxis_icon")
        imageView.image = image
        navigationItem.titleView = imageView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
