import UIKit
import os.log

class RecordMealViewController: UIViewController  , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var meal: Meal?
    
    @IBOutlet weak var meal_selection_field: UITextField!
    @IBOutlet weak var meal_name_textfield: UITextField!
    @IBOutlet weak var key_ingredients_textfield: UITextView!
    @IBOutlet weak var date_selection_field: UITextField!
    @IBOutlet weak var add_to_history: UIBarButtonItem!
    
    @IBAction func date_field_edit(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RecordMealViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        date_selection_field.text = dateFormatter.string(from: sender.date)
    }
    
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

    let pickerData = [String](arrayLiteral: "Breakfast", "Lunch", "Dinner", "Snack", "Small Meal")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        key_ingredients_textfield.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        key_ingredients_textfield.layer.borderWidth = 1.0
        key_ingredients_textfield.layer.cornerRadius = 5
        
            
        let meal_picker = UIPickerView()
        meal_picker.delegate = self
        meal_selection_field.inputView = meal_picker
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === add_to_history else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let meal_name_var = meal_selection_field.text ?? ""
        let meal_var = meal_name_textfield.text ?? ""
        let key_ingredients_var = key_ingredients_textfield.text ?? ""
        let date_var = date_selection_field.text ?? ""
        
        meal = Meal(meal: meal_var, meal_name: meal_name_var, key_ingredients: key_ingredients_var, date: date_var)
    }

}
