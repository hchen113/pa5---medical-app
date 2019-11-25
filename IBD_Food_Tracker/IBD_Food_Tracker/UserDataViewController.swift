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
    
    @IBAction func done_button(_ sender: UIBarButtonItem) {
        StartViewController.patient_data.name = name_field.text
        StartViewController.patient_data.counter = 0
        StartViewController.patient_data.status = "clear"
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startVC = storyboard.instantiateViewController(identifier: "StartViewController")
        self.navigationController?.pushViewController(startVC, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
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
