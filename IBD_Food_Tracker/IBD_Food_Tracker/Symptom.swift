import UIKit
import os.log

class Symptom:NSObject, NSCoding{
    
    var status: String
    var symptom: String
    var date: String?
    
    static let DocumentDirectory = FileManager().urls(for:.documentDirectory, in: .userDomainMask).first!
    
    static let archive_url = DocumentDirectory.appendingPathComponent("symptoms")
    
    init?(status: String?, symptom: String?, date: String?){
        
        guard !status!.isEmpty else {
            return nil
        }
        
        self.status = status!
        self.symptom = symptom!
        self.date = date!
        
    }
    
    struct PropertyKey{
        static let status = "status"
        static let symptom = "symptom"
        static let date = "date"
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(status, forKey: PropertyKey.status)
        aCoder.encode(symptom, forKey: PropertyKey.symptom)
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder:NSCoder) {

        guard let status = aDecoder.decodeObject(forKey: PropertyKey.status) as? String
            else {
                os_log("Unable to decode the status for a Symptom object.", log: OSLog.default, type: .debug)
                return nil
        }
        let symptom = aDecoder.decodeObject(forKey: PropertyKey.symptom) as? String
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as? String
        
        self.init(status: status, symptom: symptom, date: date)
        
    }
}



