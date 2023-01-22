//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation

public typealias Dispatcher = (Action) -> Void
public typealias Middleware< State: ReduxState > = (State, Action, Dispatcher) -> Void
