 //
//  NewsTableViewController.swift
//  Module-2
//
//  Created by Marc Langsman on 30/09/2019.
//  Copyright © 2019 Marc Langsman. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var titles:[String] = [
        "Blah blah blah",
        "Lorem Ipsum",
        "This is a title",
        "Blah blah blah",
        "Lorem Ipsum",
        "This is a title"
        
    ]
    
    var authors:[String] = [
        "Bob",
        "John",
        "Timmah",
        "Bob",
        "John",
        "Timmah"
    ]
    
    // var articles: [[String: Any]]?
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        API.sharedInstance.requestArticles()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onArticlesReceived(notification:)), name: API.articlesReceivedNotification, object: nil)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func onArticlesReceived(notification: Notification)
    {
        if let articles:[Article] = notification.object as? [Article]
        {
            // print ("**** BOOM:\n \(articles)")
            self.articles = articles
            self.tableView.reloadData()
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        // Configure the cell...
        
        // Try to dequeue a cell
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        
    
        // If there isn't one, create one
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIdentifier")
        }
        
        // populate cell
        
        if let article = self.articles?[indexPath.row]
        {
            cell!.textLabel?.text = article.title
            cell!.detailTextLabel?.text = article.author
        }

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        var detailVC:NewsDetailViewController = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        
        if let article = self.articles?[indexPath.row]
        {
            detailVC.article = article
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
      
    }

  

}
