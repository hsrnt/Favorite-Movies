//
//  webVC.swift
//  Favorite Movies
//
//  Created by hendri on 10/03/2016.
//  Copyright © 2016 hendri. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var urlToLoad: String!

    var webView: WKWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    
//    preloader
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        progressBar.hidden = false
        
        if keyPath == "estimatedProgress" {
            progressBar.progress = Float(webView.estimatedProgress)
        }
        if webView.estimatedProgress >= 1.0 {
            progressBar.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        
        progressBar.progress = 0
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil) //note: must be "estimatedProgress"
    }

    override func viewDidAppear(animated: Bool) {
//        set the webview bounds here:
        container.addSubview(webView)
        resetLayout()
        loadRequest(urlToLoad)
    }
    
    override func viewDidLayoutSubviews() {
        resetLayout()
    }
    
    override func viewDidDisappear(animated: Bool) {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    func resetLayout() {
        webView.frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
    }
    

    //    MARK: - load website
    
    func loadRequest(url: String) {
        if let url = NSURL(string: url) {
            let urlRequest = NSURLRequest(URL: url)
            webView.loadRequest(urlRequest)
        }

    }

}
