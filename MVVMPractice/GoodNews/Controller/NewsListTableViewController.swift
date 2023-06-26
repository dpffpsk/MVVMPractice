//
//  NewsListTableViewController.swift
//  MVVMPractice
//
//  Created by wony on 2023/06/26.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
        
        setup()
    }
    
    private func setup() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=91c395a577e442eda5d2924f37893522")!
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        
        
        print("=========\(self.articleListVM.articles[indexPath.row].title)")
        print("=========\(self.articleListVM.articles[indexPath.row].description)")

//        cell.titleLabel.text = "asdfadfsadsf"
//        cell?.titleLabel.text = "adsfads"
//        if let title = self.articleListVM.articles[indexPath.row].title {
//            print(title)
//            cell.titleLabel?.text = "asdadsfa"
//        }
        
//        if let description = self.articleListVM.articles[indexPath.row].description {
//            cell.descriptionLabel?.text = description
//        }
        
        return cell
    }
}
