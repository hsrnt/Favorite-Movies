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

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        
        
    }

    override func viewDidAppear(animated: Bool) {
//        set the webview bounds here:
        container.addSubview(webView)
        webView.frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
        
        loadRequest(urlToLoad)
    }
    


    //    MARK: - load website
    
    func loadRequest(url: String) {
        let urlRequest = NSURLRequest(URL: NSURL(string: url)!)
        webView.loadRequest(urlRequest)
    }

}
