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
    
    static let Feed_JSON_URL:URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    func requestArticles() -> Void
    {
        Alamofire.request(API.Feed_JSON_URL).responseJSON {response in
            debugPrint(response)
        }
    }
    
    class var sharedInstance: API
    {
        return _API_SharedInstance
    }
}
