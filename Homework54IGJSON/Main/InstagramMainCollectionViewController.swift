//
//  InstagramMainCollectionViewController.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/12.
//

import UIKit

private let reuseIdentifier = "ImageCell"
private let segueIdentifier = "showPost"

class InstagramMainCollectionViewController: UICollectionViewController {
    
    //資料
    let profileData = InstagramProfileData()
    let postData = InstagramPostData.postData
    
    //傳值
    var postImage = [UIImage]()
    var headshotImage:UIImage?
    var selectIndex:Int?

    @IBSegueAction func passPostData(_ coder: NSCoder) -> InstagramPostTableViewController? {
        InstagramPostTableViewController(coder: coder, postData: postImage, headshot: headshotImage!,index:selectIndex!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return postData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else{return UICollectionViewCell()}
        
        catchPhoto(url: postData[indexPath.row].ImageURL) { (data) in
            DispatchQueue.main.async {
                if indexPath == collectionView.indexPath(for: cell){
                    cell.igPhotoImageView.image = UIImage(data: data)
                    self.postImage.append(UIImage(data: data)!)
                }
            }
        }
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(InstagramProfileCollectionReusableView.self)", for: indexPath) as? InstagramProfileCollectionReusableView else {return UICollectionReusableView()}
        
        
        catchPhoto(url:profileData.profilePic) { (data) in
            DispatchQueue.main.async {
                cell.headshotImageView.image = UIImage(data: data)
                self.headshotImage = UIImage(data: data)
            }
        }
        
        cell.updateProfileUI(data: profileData)
        return cell
    }
    
    //delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        performSegue(withIdentifier: segueIdentifier, sender: nil)
        
    }
    
    //抓圖
    func catchPhoto(url:String,completion:@escaping(Data)->()){
        guard let itemPic = URL(string:url) else{return}
        URLSession.shared.dataTask(with:itemPic) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }.resume()
    }
}
