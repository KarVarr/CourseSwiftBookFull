//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Karen Vardanian on 23.01.2023.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyValue: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
