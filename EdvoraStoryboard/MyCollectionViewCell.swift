//
//  MyCollectionViewCell.swift
//  EdvoraAssessment
//
//  Created by Margi  Bhatt on 06/02/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var brandNameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Model) {
        self.imageView.image = model.image
        self.productNameLabel.text = model.productName
        self.brandNameLabel.text = model.brandName
        self.amountLabel.text = model.amount
        self.locationLabel.text = model.location
        self.dateLabel.text = model.date
        self.descriptionLabel.text = model.description
    }

}
