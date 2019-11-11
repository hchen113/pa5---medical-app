//
//  RecordTableViewController.swift
//  medical_app
//
//  Created by Henry Chen on 11/8/19.
//  Copyright © 2019 Henry Chen. All rights reserved.
//

import UIKit
import os.log

class RecordTableViewController: UITableViewController {
    
    var meals = [Meal]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
 
        let meal = meals[indexPath.row]
        cell.meal_selection.text = meal.meal
        cell.meal_name.text = meal.meal_name
        cell.meal_date.text = meal.date
        return cell
    }
    
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RecordMealViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadSampleMeals()
    }
    
    private func loadSampleMeals() {
        
        guard let meal1 = Meal(meal: "Breakfest", meal_name: "Cereal", key_ingredients: "Whole Grain", date: "November 10, 2019") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(meal: "Lunch", meal_name: "Pho", key_ingredients: "Rice Noodles and Beef", date: "November 10, 2019") else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(meal: "Dinner", meal_name: "Philly Cheese Steak", key_ingredients: "White Sub with beef and vegtables", date: "November 10, 2019") else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
   
    
    
    func saveMeals(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.archive_url.path)
        
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    func loadMeals() -> [Meal]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.archive_url.path) as? [Meal]
    }
    

}
