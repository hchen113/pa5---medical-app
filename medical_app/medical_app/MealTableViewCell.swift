//
//  MealTableViewCell.swift
//  medical_app
//
//  Created by Henry Chen on 11/10/19.
//  Copyright © 2019 Henry Chen. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var meal_selection: UILabel!
    @IBOutlet weak var meal_date: UILabel!
    @IBOutlet weak var meal_name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
