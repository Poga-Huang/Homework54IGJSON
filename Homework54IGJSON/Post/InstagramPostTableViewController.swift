//
//  InstagramPostTableViewController.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/13.
//

import UIKit

private let reuseIdentifier = "postCell"

class InstagramPostTableViewController: UITableViewController {
    
    //資料
    let getPost:[UIImage]
    let postData = InstagramPostData.postData
    let headshot:UIImage
    let index:Int
    init?(coder:NSCoder,postData:[UIImage],headshot:UIImage,index:Int){
        self.getPost = postData
        self.headshot = headshot
        self.index = index
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTilteView()
        //根據上一頁點選的圖片移動
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .middle, animated: false)
    }
    
    //Navigation Title
    func setupTilteView(){
        let titleLabel = UILabel()
        titleLabel.text = "wooyouxtaro\n貼文"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.navigationItem.titleView = titleLabel
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.headshotImageView.image = headshot
        cell.postPhotoImageView.image = getPost[indexPath.row]
        
        let allPostContent = convertAttributedString(data: postData, index: indexPath.row)
        cell.postlabel.attributedText = allPostContent
        
        //判斷有沒有留言
        if postData[indexPath.row].commentCount != 0{
            cell.commentCountLabel.text = "查看\(postData[indexPath.row].commentCount)則留言"
        }else{
            cell.commentCountLabel.isHidden = true
        }
        //po文時間
        cell.postTimeLabel.text = convertTimeFormat(second: postData[indexPath.row].postTimeSecond)
        //按讚人數
        cell.likedLabel.text = "poga_07和其他\(postData[indexPath.row].likedCount-1)人都說讚"
        
        return cell
    }
    
    
    //轉換時間格式
    func convertTimeFormat(second:Int)->String{
        let convertTime = Date(timeIntervalSince1970: TimeInterval(second))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年M月d日"
        return dateFormatter.string(from: convertTime)
    }
    //轉換成NSAtrributedString
    func convertAttributedString(data:[InstagramPostDataStruct],index:Int)->NSMutableAttributedString{
        let userName = "wooyouxtaro"
        let attribute = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16)]
        let nameAttribute = NSAttributedString(string: userName, attributes: attribute)
        let postAttribute = NSAttributedString(string:data[index].postText)
        let allPostContent = NSMutableAttributedString(attributedString: nameAttribute)
        allPostContent.append(postAttribute)
        return allPostContent
    }
    
}
