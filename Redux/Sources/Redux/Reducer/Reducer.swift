//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation

public typealias Reducer< State: ReduxState> = (_ state: State, _ action: Action) -> State

