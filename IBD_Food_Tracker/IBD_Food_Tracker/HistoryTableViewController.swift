import UIKit
import os.log

class HistoryTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    class history_data{
        static let shared = history_data()
        private init() {}
        var entries = [AnyObject]()
        
    }

    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history_data.shared.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HistoryTableViewCell"
               
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell.")
        }
        
        let object = history_data.shared.entries[indexPath.row]
        
        if object is Meal{
            let meal = object as! Meal
            cell.selection.text = meal.meal
            cell.discription.text = meal.meal_name
            cell.date.text = meal.date
        }else{
            let symptom = object as! Symptom
            cell.selection.text = symptom.status
            cell.discription.text = symptom.symptom
            cell.date.text = symptom.date
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //loadSampleMeals()
    }
    
    private func loadSampleMeals() {
        guard let meal1 = Meal(meal: "Breakfest", meal_name: "Cereal", key_ingredients: "Whole Grain", date: "November 10, 2019") else {
             fatalError("Unable to instantiate meal1")
         }
         guard let meal2 = Meal(meal: "Lunch", meal_name: "Pho", key_ingredients: "Rice Noodles and Beef", date: "November 10, 2019") else {
             fatalError("Unable to instantiate meal2")
         }
         guard let meal3 = Meal(meal: "Dinner", meal_name: "Philly Cheese Steak", key_ingredients: "White sub with beef and vegtables", date: "November 10, 2019") else {
             fatalError("Unable to instantiate meal3")
         }
         history_data.shared.entries += [meal1, meal2, meal3]
     }
     
    

}
