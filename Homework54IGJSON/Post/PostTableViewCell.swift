//
//  PostTableViewCell.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/13.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var postlabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var likedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headshotImageView.layer.cornerRadius = headshotImageView.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
