//
//  CollectionCV.swift
//  TableViewInsideCollectionView
//
//  Created by MD Tarif khan on 1/8/22.
//

import UIKit

class CollectionCV: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 10
    }

}
