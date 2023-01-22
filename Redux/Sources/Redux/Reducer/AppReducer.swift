//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation
import Network

public func appReducer(_ state: AppState , _ action: Action) -> AppState {
    var state = state
    state.newsState = reducerNews(state.newsState, action)
    return state
}
