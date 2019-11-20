import UIKit
import os.log

class RecordSymptomViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
        
    var symptom: Symptom?
    
    
    @IBOutlet weak var status_selection_field: UITextField!
    @IBOutlet weak var symptom_textfield: UITextView!
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
        status_selection_field.text = pickerData[row]
    }

    let pickerData = [String](arrayLiteral: "Flare Up", "Clear")
        
    override func viewDidLoad() {
        super.viewDidLoad()

        symptom_textfield.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        symptom_textfield.layer.borderWidth = 1.0
        symptom_textfield.layer.cornerRadius = 5
        
                
        let status_picker = UIPickerView()
        status_picker.delegate = self
        status_selection_field.inputView = status_picker
    }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == add_to_history else {
            os_log("The add_to_history button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
            
        let status_var = status_selection_field.text ?? ""
        let symptom_var = symptom_textfield.text ?? ""
        let date_var = date_selection_field.text ?? ""
            
        symptom = Symptom(status: status_var, symptom: symptom_var, date: date_var)
    }

}



