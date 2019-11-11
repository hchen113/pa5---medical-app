import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var meal_selection: UILabel!
    @IBOutlet weak var meal_name: UILabel!
    @IBOutlet weak var date: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
