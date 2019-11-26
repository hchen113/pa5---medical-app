//
//  UserDataViewController.swift
//  IBD_Food_Tracker
//
//  Created by Henry Chen on 11/24/19.
//  Copyright © 2019 Henry Chen. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {
    
    @IBOutlet weak var name_field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDataSegue",
            let destinationVC = segue.destination as? StartViewController {
            
            StartViewController.patient_data.name = name_field.text
            StartViewController.patient_data.counter = 0
            StartViewController.patient_data.status = "clear"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
