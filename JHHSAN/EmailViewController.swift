//  Endri Shkembi's Code
//  EmailViewController.swift
//  JHHSAN
//
//  Created by student3 on 2/15/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
    @IBOutlet weak var emailWebView: UIWebView!
    var urlString = "https://gapps.d214.org/"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
        
    }
    func loadAddressURL(){
        let requestUrl = NSURL(string: urlString)
        let request = NSURLRequest(url: requestUrl as! URL)
        emailWebView.loadRequest(request as URLRequest)
    }
 
    

}
