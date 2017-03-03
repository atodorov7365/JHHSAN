//
//  Safari2ViewController.swift
//  JHHSAN
//
//  Created by student3 on 1/12/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import SafariServices

class Safari2ViewController: UIViewController,SFSafariViewControllerDelegate {
    
    @IBOutlet weak var webViewActivity: UIWebView!
    var urlString = "http://jhhs.d214.org/co-curricular/activities/"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
        
    }
    func loadAddressURL(){
        let requestUrl = NSURL(string: urlString)
        let request = NSURLRequest(url: requestUrl as! URL)
        webViewActivity.loadRequest(request as URLRequest)
    }
   
    

}
