//
//  CustomTableViewCell.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 24/10/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var labelHero: UILabel!
    @IBOutlet weak var descriptionHero: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
