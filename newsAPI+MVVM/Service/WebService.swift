//
//  WebService.swift
//  newsAPI+MVVM
//
//  Created by Dustin on 2020/10/12.
//

import Foundation


class WebService {
    
    
    
    func getAriticles(url : URL, completion:@escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
           
                
            let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
                print(articleList?.articles)
                
            }
            
        }.resume()
        
        
    }
    
    
    
}
