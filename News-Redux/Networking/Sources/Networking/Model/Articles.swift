//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 30/12/2022.
//

import Foundation

public struct NewsFactory: Codable {
   public let articles: [Articles]
}

public struct Articles: Codable {
    public let title: String?
    public let author: String?
    public let description: String?
    public let urlToImage: String?
    public init(title: String?, author: String?,description: String? ,urlToImage: String?) {
        self.title = title
        self.author = author
        self.description = description
        self.urlToImage = urlToImage
    }
    
}
