//
//  Article.swift
//  newsAPI+MVVM
//
//  Created by Dustin on 2020/10/12.
//

import Foundation

struct ArticleList: Decodable {
    let articles : [Article]
}


struct Article: Decodable {
    let title : String
    let description : String?
}


