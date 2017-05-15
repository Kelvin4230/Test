

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var gets: UIButton!
    @IBOutlet weak var showlatLabel: UILabel!
    @IBOutlet weak var showlongLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func gets(_ sender: Any) {
    }
}
