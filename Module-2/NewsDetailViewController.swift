//
//  NewsDetailViewController.swift
//  Module-2
//
//  Created by Marc Langsman on 01/10/2019.
//  Copyright © 2019 Marc Langsman. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController, WKNavigationDelegate  {
    
    @IBOutlet weak var imageView:UIImageView?
    @IBOutlet weak var titleLabel:UILabel?
    @IBOutlet weak var authorLabel:UILabel?
    @IBOutlet weak var webView:WKWebView?
    @IBOutlet weak var heightConstraint:NSLayoutConstraint?
    var author:String?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel?.text = self.title
        authorLabel?.text = self.author
        
        webView?.navigationDelegate = self
        
        let request = URLRequest(url: URL(string: "https://learnappmaking.com/lipsum.html")!)
        webView?.load(request)
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        
        webView.evaluateJavaScript("document.readyState",
                                   completionHandler: { result, error in
            
                if result == nil || error  !=  nil {
                    return
                }
                
                                    print ("booya")
                webView.evaluateJavaScript("document.body.offsetHeight",
                                        completionHandler:
                    {result, error in
                    
                        if let height = result as? CGFloat
                        {
                            self.heightConstraint?.constant = height
                        }
                    })
                
            })
            
            
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
