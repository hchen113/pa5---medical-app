import UIKit

class StartViewController: UIViewController {
    
    struct patient_data{
        static var name = "Henry"
        static var counter = 0
        static var status = "clear"
    }

    class history_data{
        static let shared = history_data()
        
        private init() {}
        
        
        
    }
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var day_counter: UILabel!
    @IBOutlet weak var experiance_flare: UIButton!
    
    
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
        // Do any additional setup after loading the view.
        
        
        let currentDate = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour,.minute,.second], from: currentDate as Date)
        let hour = components.hour
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = DateFormatter.Style.full
        let convertedDate = dateFormatter.string(from: currentDate as Date)
        
        let day_count = patient_data.counter
        let status_info = patient_data.status
        
        if (hour! < 12){
            self.welcome.text = "Good morning, " + patient_data.name
        }else if (hour! > 12 && hour! < 17){
            self.welcome.text = "Good afternoon, " + patient_data.name
        }else if (hour! > 17){
            self.welcome.text = "Good evening, " + patient_data.name
        }else{
            self.welcome.text = "Hello, " + patient_data.name
        }
        self.date.text = "Today is \n" + String(convertedDate)
        self.day_counter.text = "Days since last flare up: " + String(day_count)
        self.status.text = "Today's status is " + status_info
        if (patient_data.status == "clear"){
            experiance_flare.setTitle("experiancing a flare up", for: .normal)
        }else{
            experiance_flare.setTitle("symptom free", for: .normal)
        }
    }

    func log_status(){
        
    }

}

