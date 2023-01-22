//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Combine
import Networking

public struct ReduxNewsState: ReduxState {
    public var newsPublisher: AnyPublisher<[Articles], Error> = Empty(completeImmediately: false).eraseToAnyPublisher()
}

public struct ReduxNewsSelectionState: ReduxState {
    public var articleSelectedPublisher: PassthroughSubject< Articles ,Never > = .init()
}
