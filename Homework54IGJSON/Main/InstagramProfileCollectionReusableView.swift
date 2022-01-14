//
//  InstagramProfileCollectionReusableView.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/12.
//

import UIKit

class InstagramProfileCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileTextView: UITextView!
    
    //更新元件內容
    func updateProfileUI(data:InstagramProfileData){
        nameLabel.text = data.full_name
        profileTextView.text = data.biography + "\n" + data.external_url
        postCountLabel.text = "\(data.postCount)"
        followLabel.text = "\(data.edge_followed_by)"
        followingLabel.text = "\(data.edge_follow)"
    }
    
    
    //讓大頭照變圓形
    override func awakeFromNib() {
        headshotImageView.layer.cornerRadius = headshotImageView.bounds.width/2
        
    }
}
