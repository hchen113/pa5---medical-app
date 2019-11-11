import UIKit

class Meal{
    var meal: String
    var meal_name: String
    var key_ingredients: String
    var date: String?
    
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
}



