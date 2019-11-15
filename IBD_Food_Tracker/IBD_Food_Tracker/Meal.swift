import UIKit
import os.log

class Meal:NSObject, NSCoding{
    
    var meal: String
    var meal_name: String
    var key_ingredients: String
    var date: String?
    
    static let DocumentDirectory = FileManager().urls(for:.documentDirectory, in: .userDomainMask).first!
    
    static let archive_url = DocumentDirectory.appendingPathComponent("meals")
    
    init?(meal: String, meal_name: String?, key_ingredients: String?, date: String?){
        
        guard !meal.isEmpty else {
            return nil
        }
        
        guard !key_ingredients!.isEmpty  else {
            return nil
        }
        
        self.meal = meal
        self.meal_name = meal_name!
        self.key_ingredients = key_ingredients!
        self.date = date
        
    }
    
    struct PropertyKey{
        static let meal = "meal"
        static let meal_name = "meal_name"
        static let key_ingredients = "key_ingredients"
        static let date = "date"
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(meal, forKey: PropertyKey.meal)
        aCoder.encode(meal_name, forKey: PropertyKey.meal_name)
        aCoder.encode(key_ingredients, forKey: PropertyKey.key_ingredients)
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder:NSCoder) {

        guard let meal = aDecoder.decodeObject(forKey: PropertyKey.meal) as? String
            else {
                os_log("Unable to decode the meal for a Meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        
        let meal_name = aDecoder.decodeObject(forKey: PropertyKey.meal_name) as? String
        let key_ingredients = aDecoder.decodeObject(forKey: PropertyKey.key_ingredients) as? String
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as? String
        
        self.init(meal: meal, meal_name: meal_name, key_ingredients: key_ingredients, date: date)
        
    }
}



