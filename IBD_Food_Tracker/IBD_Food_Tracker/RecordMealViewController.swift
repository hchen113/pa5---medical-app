import UIKit

class RecordMealViewController: UIViewController  , UIPickerViewDelegate, UIPickerViewDataSource{
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
     
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        meal_selection_field.text = pickerData[row]
    }
    

    var meal: Meal?
    
    let pickerData = [String](arrayLiteral: "Breakfast", "Lunch", "Dinner", "Snack", "Small Meal")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
