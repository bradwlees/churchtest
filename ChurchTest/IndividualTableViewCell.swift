//
//  IndividualTableViewCell.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//

import UIKit

class IndividualTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageIndividual: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
