//
//  NewsTableCell.swift
//  News-Redux
//
//  Created by Ahmed Fathy on 31/12/2022.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblDescrption: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuther: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureBackViewUI()
        configureImageViewUI()
    }
    fileprivate func configureBackViewUI(){
        backView.layer.cornerRadius = 20
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 3
        backView.layer.shadowOpacity = 0.21
        backView.layer.shadowOffset = .init(width: 0, height: 3.7)
    }
    fileprivate func configureImageViewUI(){
        imgNews.layer.cornerRadius = 10
        imgNews.layer.shadowColor = UIColor.black.cgColor
        imgNews.layer.shadowRadius = 2
        imgNews.layer.shadowOpacity = 0.19
        imgNews.layer.shadowOffset = .init(width: 0, height: 2)
        imgNews.clipsToBounds = true
        imgNews.layer.masksToBounds = true
    }
}
