//
//  NewsViewController.swift
//  News-Redux
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import UIKit
import Redux
import Combine

final class NewsViewController: UIViewController {
    
    private var mainView: NewsView?
    private var anyCancellable = Set<AnyCancellable>()

    override func loadView() {
        super.loadView()
        mainView = NewsView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        dispatchImplementNewsFromApi()
        listenToSelectedArticle()
    }
    
    func configureNavigation(){
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func dispatchImplementNewsFromApi(){
        store.dispatch(ImplementNewsApi())
    }
    
    func listenToSelectedArticle(){
        newsSelectedStore
            .$state
            .flatMap({$0.articleSelectedPublisher})
            .sink { articel in
                print(articel)
            }.store(in: &anyCancellable)
    }
    
}
