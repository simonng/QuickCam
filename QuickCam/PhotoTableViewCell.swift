//
//  PhotoTableViewCell.swift
//  QuickCam
//
//  Created by Simon Ng on 27/1/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var photoImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
