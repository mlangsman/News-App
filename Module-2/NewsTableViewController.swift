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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        // Try to dequeue a cell
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        
    
        // If there isn't one, create one
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIdentifier")
        }
        
        // populate cell
        
        cell!.textLabel?.text = titles[indexPath.row]
        cell!.detailTextLabel?.text = authors[indexPath.row]

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var detailVC:NewsDetailViewController = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        
        detailVC.title = titles[indexPath.row]
        detailVC.author = authors[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
      
    }

  

}
