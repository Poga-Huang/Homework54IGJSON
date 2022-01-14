//
//  ImageCollectionViewCell.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/12.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var igPhotoImageView: UIImageView!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    
    //設定每個圖片寬度為畫面扣掉間隔的1/3
    static let width = floor(Double((UIScreen.main.bounds.width-2)/3))
    
    
    override func awakeFromNib() {
        imageViewWidth?.constant = Self.width
    }
}
