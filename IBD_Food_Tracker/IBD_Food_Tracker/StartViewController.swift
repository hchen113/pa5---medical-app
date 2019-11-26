import UIKit

class StartViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    struct patient_data{
        static var name:String! = nil
        static var counter:Int? = nil
        static var status:String?  = nil
    }

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var day_counter: UILabel!
    @IBOutlet weak var experiance_flare: UIButton!
    @IBOutlet weak var new_user_button: UIButton!
   
    @IBAction func status_button(_ sender: UIButton) {
        if (patient_data.status == "clear"){
            self.status.text = "Status is now flare up"
            patient_data.status = "flare up"
            experiance_flare.setTitle("symptom free", for: .normal)
        }else if (patient_data.status == "flare up"){
            self.status.text = "Status is now clear"
            patient_data.status = "clear"
            experiance_flare.setTitle("experiancing a flare up", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPatientData()
        
        let currentDate = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour,.minute,.second], from: currentDate as Date)
        let hour = components.hour
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = DateFormatter.Style.full
        let convertedDate = dateFormatter.string(from: currentDate as Date)
        
        let status_info = patient_data.status
        
        if (hour! < 12){
            self.welcome.text = "Good morning, " + (patient_data.name ?? "NULL")
        }else if (hour! > 12 && hour! < 17){
            self.welcome.text = "Good afternoon, " + (patient_data.name ?? "NULL")
        }else if (hour! > 17){
            self.welcome.text = "Good evening, " + (patient_data.name ?? "NULL")
        }else{
            self.welcome.text = "Hello, " + (patient_data.name ?? "NULL")
        }
        self.date.text = "Today is \n" + String(convertedDate)
        self.day_counter.text = "Days since last flare up: " + String(patient_data.counter ?? 0)
        self.status.text = "Today's status is " + (status_info ?? "NULL")
        if (patient_data.status == "clear"){
            experiance_flare.setTitle("experiancing a flare up?", for: .normal)
        }else{
            experiance_flare.setTitle("symptom free?xw", for: .normal)
        }
    }
    
    
    func checkPatientData(){
        if(patient_data.name == nil){
            new_user_button.isHidden = false
            welcome.isHidden = true
            status.isHidden = true
            day_counter.isHidden = true
            experiance_flare.isHidden = true
        }else{
            new_user_button.isHidden = true
            welcome.isHidden = false
            status.isHidden = false
            day_counter.isHidden = false
            experiance_flare.isHidden = false
        }
    }


}

