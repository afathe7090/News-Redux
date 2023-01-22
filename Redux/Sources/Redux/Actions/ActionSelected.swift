//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 01/01/2023.
//

import Foundation
import Networking

public struct NewsSelectedAction: Action {
    public let article: Articles
    public init(article: Articles){
        self.article = article
    }
}
