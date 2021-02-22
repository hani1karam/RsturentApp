//
//  PrdouctTableViewCell.swift
//  RsturentApp
//
//  Created by Hany Karam on 2/22/21.
//

import UIKit
import Kingfisher

class PrdouctTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addtofav: UIButton!
    @IBOutlet weak var View: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        View.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        View.layer.cornerRadius = 15.0
        //View.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        View.layer.masksToBounds = false
        View.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        View.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        View.layer.shadowOpacity = 0.8
        
             //[.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        View.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(compines: ProductModelDataClass) {
        img.kf.indicatorType = .activity
        if let img = URL(string: compines.image ?? ""){
            DispatchQueue.main.async {
                self.img.kf.setImage(with: img)
            }
        }
    }

}
