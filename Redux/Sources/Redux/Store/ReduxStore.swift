//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation

public let store = Store(reducer: appReducer, state: AppState())
// News APi Store with there reducer
// News seleceted store apit

public final class Store< State: ReduxState>: ObservableObject {
    
    var reducer: Reducer<State>
    @Published public var state: State
    
    public init(reducer: @escaping Reducer<State>,
                state: State) {
        self.reducer = reducer
        self.state = state
    }
    
    public func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state,action)
        }
  
    }
}
