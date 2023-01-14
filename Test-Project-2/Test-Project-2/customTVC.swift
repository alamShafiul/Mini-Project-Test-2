//
//  customTVC.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//

import UIKit

class customTVC: UITableViewCell {

    
    @IBOutlet weak var cellBGView: UIView!
    
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
