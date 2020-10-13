//
//  ArticleViewModel.swift
//  newsAPI+MVVM
//
//  Created by Dustin on 2020/10/12.
//

import Foundation

struct ArticleListViewModel {
    let ariticles: [Article]
    
}

extension ArticleListViewModel {
    var numberOfSection : Int {
        return 1
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.ariticles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.ariticles[index]
        return ArticleViewModel(article)
    }
}


struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description ?? ""
    }
    
    
}


