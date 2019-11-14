//
//  Article.swift
//  Module-2
//
//  Created by Marc Langsman on 04/11/2019.
//  Copyright © 2019 Marc Langsman. All rights reserved.
//

import Foundation
import RealmSwift

class Article:Object
{
    
    @objc dynamic var id:Int = 0
    @objc dynamic var title:String = ""
    @objc dynamic var author:String = ""
    @objc dynamic var content:String = ""
    @objc dynamic var thumbnailURL:String = ""
    @objc dynamic var articleURL:String = ""
    @objc dynamic var excerpt:String = ""
    @objc dynamic var creationDate:Date = Date()
    
    // var description: String {
    //    return "Article:\(self.creationDate) --\(self.title) --\(self.articleURL)" }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
