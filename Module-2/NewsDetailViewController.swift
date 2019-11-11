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
    
    var content:String = ""
    
    var article:Article?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if article == nil {
            return
        }

        // Do any additional setup after loading the view.
        
        // titleLabel?.text = self.title
        // authorLabel?.text = self.author
        
        self.title = article?.title
        titleLabel?.text = article?.title
        authorLabel?.text = article?.author
        
        imageView?.image = UIImage(contentsOfFile: <#T##String#>

        webView?.navigationDelegate = self
        webView?.scrollView.isScrollEnabled = false
        
        // let request = URLRequest(url: URL(string: "https://learnappmaking.com/lipsum.html")!)
        // webView?.load(request)
        
        webView?.loadHTMLString("""
            <html>
                <head>
                <style>body { font-family: -apple-system, Helvetica; sans-serif; }</style>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                </head>
                <body>
                    \(article!.content)
                </body>
            </html>
        """, baseURL: nil)
        
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
