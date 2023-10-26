//
//  CustomTableViewCell.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 24/10/23.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var labelHero: UILabel!
    @IBOutlet weak var descriptionHero: UITextView!
   static let identifier: String = "Custom_Cell"
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageHero.image = nil
        labelHero.text = nil
        descriptionHero.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 8
               container.layer.shadowColor = UIColor.gray.cgColor
               container.layer.shadowOffset = .zero
               container.layer.shadowRadius = 8
               container.layer.shadowOpacity = 0.4

        imageHero.layer.cornerRadius = 8
        imageHero.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]

               selectionStyle = .none
    }
    
    func updateData(name: String? = nil,
                    photo: String? = nil,
                    decription: String? = nil) {
        self.labelHero.text = name
        self.descriptionHero.text = description
        self.imageHero.kf.setImage(with: URL(string: photo ?? ""))
        
    }
 
    
}
