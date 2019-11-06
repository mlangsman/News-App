//
//  API.swift
//  Module-2
//
//  Created by Marc Langsman on 31/10/2019.
//  Copyright © 2019 Marc Langsman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let _API_SharedInstance = API()

class API
{
    static var articles: [[String: Any]]?
    
    static let Feed_JSON_URL:URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    // Singleton
    class var sharedInstance: API
    {
        return _API_SharedInstance
    }
    
    func requestArticlesCustom() -> [[String: Any]]?
    {
        Alamofire.request(API.Feed_JSON_URL).responseJSON {response in
            debugPrint(response)
        
            if let jsonResponse = response.value as? [[String: Any]]
            {
                debugPrint("Tiger is \(jsonResponse[1]["title"]!)")
                API.articles = jsonResponse
            }
            
        }
        
         return API.articles
        
    }
    
    func requestArticles() -> Void
    {
        Alamofire.request(API.Feed_JSON_URL).responseJSON { response in
            
            if let data = response.data
            {
                do
                {
                    let json = try JSON(data: data)
                    
                    // print("JSON: \(json)")
                    
                    self.processArticles(json: json)
                }
                
                catch
                {
                    print("JSON Error: \(error)")
                    
                }
            }
            
            else
            {
                print(response.result.error)
            }
            
        }
    }
    
    func processArticles(json: JSON)
    {
        print(json)
        
        var articles:[Article] = [Article]()
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for (key, item):(String, JSON) in json
        {
            var article = Article()
            
            if let title:String = item["title"].string {
                article.title = title
            }
            
            if let id:Int = item["id"].int {
                article.id = id
            }
            
            if let author:String = item["author"].string {
                article.author = author
            }
            
            if let content:String = item["content"].string {
                article.content = content
            }
            
            if let thumbnailURL:String = item["thumbnail"].string {
                article.thumbnailURL = thumbnailURL
            }
            
            if let articleURL:String = item["permalink"].string {
                article.articleURL = articleURL
            }
            
            if let excerpt:String = item["excerpt"].string {
                article.excerpt = excerpt
            }

            if let dateString = item["date"].string,
               let creationDate = dateFormatter.date(from: dateString)
            {
               
                article.creationDate = creationDate
            }
            else
            {
                print ("error")
            }
            
            
            articles.append(article)
        }
        
       print (articles)
        
    }
    
    
    

}
