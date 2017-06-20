//
//  PersonListTableViewController.swift
//  Upraxis
//
//  Created by franz.deguzman on 18/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import UIKit
import SVProgressHUD

class PersonListTableViewController: UITableViewController {
    
    
    var personList = [Person]()
    var selectedPerson = Person()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor(Color.primaryColor)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundLayerColor(Color.primaryColor)
        SVProgressHUD.setMinimumDismissTimeInterval(5.0)
        SVProgressHUD.setRingThickness(3.0)
        SVProgressHUD.show()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "upraxis_icon")
        imageView.image = image
        navigationItem.titleView = imageView

        
        //Caching not necessary since calling of data happens only in didLoad of the main page
        getPersonDetails()
    }
    
    
    func getPersonDetails(){
        sendAsychronousRequest(urlString: API.personList, params: "", method: "GET") { (webReponse) in
            if (webReponse.success) {
                print(webReponse.payloadArray)
                
                for x in 0..<webReponse.payloadArray.count{
                     var person = Person()
                     var contactPerson = ContactPerson()
                        let payloadItem = webReponse.payloadArray[x] as! NSDictionary
                    let payloadContactPerson = payloadItem["contact_person"] as! NSDictionary
                    
                    contactPerson = ContactPerson(name: payloadContactPerson["name"] as! String, mobileNo: payloadContactPerson["mobile_number"] as! String)
                    
                    person = Person(id: payloadItem["id"] as! String, firstName: payloadItem["first_name"] as! String, lastName: payloadItem["last_name"] as! String, birthDate: payloadItem["birthday"] as! String, email: payloadItem["email"] as! String, mobileNo: payloadItem["mobile_number"] as! String, address: payloadItem["address"] as! String, contactPerson: contactPerson)
                    
                    self.personList.append(person)

                }
                
                self.tableView.reloadData()
            }
            else{
                DispatchQueue.main.async(execute: {
                    SVProgressHUD.dismiss()
                    showAlertWithTitle(title: nil, andMessage: "Something went wrong", withOkButtonTitle: "Try Again", andCancelBurronTitle: "Dismiss"){(returnAlert: UIAlertController,returnAlertButtonIndex:Int) -> Void in
                        switch (returnAlertButtonIndex) {
                        case 0:
                            self.present(returnAlert, animated: true, completion: nil)
                            break
                        case 1:
                            
                            break
                        case 2:
                            self.getPersonDetails()
                            break
                        default:
                            break
                        }
                    }
                    
                    
                })

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "persoonCell", for: indexPath)

        cell.textLabel?.text = "\(personList[indexPath.row].firstName) \(personList[indexPath.row].lastName)"
        cell.accessoryType = .disclosureIndicator
        
        SVProgressHUD.dismiss()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPerson = personList[indexPath.row]
        performSegue(withIdentifier: "personDetails", sender: nil)
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PersonDetailViewController
        vc.selectedPerson = selectedPerson
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
