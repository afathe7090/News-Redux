//
//  NewsView.swift
//  News-Redux
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import UIKit
import Redux
import Combine

final class NewsView: UIView {
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        return tableView
    }()
    private var anyCancellable = Set<AnyCancellable>()
    private var adapter: NewsDataSources?
    init(){
        super.init(frame: .zero)
        backgroundColor = .white
        configureNewsTableViewConstraints()
        configureNewsData()
    }
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
    fileprivate func configureNewsTableViewConstraints(){
        addSubview(newsTableView)
        newsTableView.register(UINib(nibName: String(describing: NewsTableCell.self), bundle: nil)
                               ,forCellReuseIdentifier: String(describing: NewsTableCell.self))
        let newsTableViewConstraint: [ NSLayoutConstraint ] = [
            newsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(newsTableViewConstraint)
    }
    fileprivate func configureNewsData(){
        store.$state
            .flatMap({
                $0.newsState.newsPublisher
            })
            .receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: { [unowned self] news in
                print(news)
                self.adapter = .init(news)
                self.newsTableView.delegate = self.adapter
                self.newsTableView.dataSource = self.adapter
                self.newsTableView.reloadData()
            }.store(in: &anyCancellable)
    }

}
