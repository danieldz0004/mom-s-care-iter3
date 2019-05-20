//
//  VaccinationTableViewCell.swift
//  Week9Tutorial
//
//  Created by Daniel Dz on 15/4/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit

class VaccinationTableViewCell: UITableViewCell {

    @IBOutlet weak var ausLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
