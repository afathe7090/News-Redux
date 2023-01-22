//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation
import Networking

public func reducerNews(_ state: ReduxNewsState, _ action: Action) -> ReduxNewsState {
    var state = state
    switch action {
    case is ImplementNewsApi:
        let url = "https://newsapi.org/v2/top-headlines?apiKey=f0b310a6e5f349838307ddd53bfa66c0&country=AR"
        let newsRequest = Session.instance.request(from: url, NewsFactory.self).map({$0.articles}).eraseToAnyPublisher()
        state.newsPublisher = newsRequest
    default:
        break
    }
    return state
}

public func reducerSelectionNew(_ state: ReduxNewsSelectionState ,_ action: Action) -> ReduxNewsSelectionState {
    let state = state
    switch action{
    case let selectedArticle as NewsSelectedAction:
        state.articleSelectedPublisher.send(selectedArticle.article)
    default:
        break
    }
    return state
}
