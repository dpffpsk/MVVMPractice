//
//  Article.swift
//  MVVMPractice
//
//  Created by wony on 2023/06/26.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    var title: String?
    var description: String?
}
