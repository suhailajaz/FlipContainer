//
//  CVCell.swift
//  Project-13-FlipContainer
//
//  Created by suhail on 18/01/24.
//

import UIKit

class CVCell: UICollectionViewCell {
  
    static let identifier = "CVCell"
    static let nib = UINib(nibName: "CVCell", bundle: nil)
    
    @IBOutlet var lblCvCell: UILabel!
    @IBOutlet var imgCVCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
