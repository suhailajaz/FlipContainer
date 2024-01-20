//
//  TableViewCell.swift
//  Project-13-FlipContainer
//
//  Created by suhail on 18/01/24.
//

import UIKit

class TVCell: UITableViewCell {
   
    static let identifier = "TVCell"
    static let nib = UINib(nibName: "TVCell", bundle: nil)
    
    @IBOutlet var lblTblCell: UILabel!
    @IBOutlet var imgTblCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
