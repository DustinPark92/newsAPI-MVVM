//
//  NewsListTableViewController.swift
//  newsAPI+MVVM
//
//  Created by Dustin on 2020/10/12.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    private var articleListViewModel : ArticleListViewModel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=67da44ef7e454095a10ad8061bab4399")!
        
        
        WebService().getAriticles(url: url) { articles in
            
            guard let articles = articles else { return }
            
            self.articleListViewModel = ArticleListViewModel(ariticles: articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSection
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
            

        }
        let articleViewModel =  self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
        
        
    }
    
    
    
    
}
