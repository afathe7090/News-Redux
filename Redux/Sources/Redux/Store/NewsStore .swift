//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 01/01/2023.
//

import Foundation

public let newsStore = Store(reducer: reducerNews, state: ReduxNewsState())
public let newsSelectedStore = Store(reducer: reducerSelectionNew, state: ReduxNewsSelectionState())
