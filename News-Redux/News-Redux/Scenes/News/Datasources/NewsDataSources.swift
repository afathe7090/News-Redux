//
//  NewsDataSources.swift
//  News-Redux
//
//  Created by Ahmed Fathy on 30/12/2022.
//
import UIKit
import Redux
import Networking
import Kingfisher

final class NewsDataSources: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private let newsDataSource: [Articles]
    
    init(_ news: [Articles]) {
        self.newsDataSource = news
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableCell.self), for: indexPath) as! NewsTableCell
        let article = newsDataSource[indexPath.row]
        cell.lblTitle.text = article.title
        cell.lblAuther.text = article.author
        cell.lblDescrption.text = article.description
        
        let sourceURL = URL(string: article.urlToImage ?? "")
        cell.imgNews.kf.indicatorType = .activity
        cell.imgNews.kf.setImage(with: sourceURL, options: [.transition(.fade(0.8))])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = newsDataSource[indexPath.row]
        newsSelectedStore.dispatch(NewsSelectedAction(article: selectedArticle))
    }
}
