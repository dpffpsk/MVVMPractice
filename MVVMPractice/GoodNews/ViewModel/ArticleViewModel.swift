//
//  ArticleViewModel.swift
//  MVVMPractice
//
//  Created by wony on 2023/06/26.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}

struct ArticleListViewModel {
    let articles: [Article]
}
