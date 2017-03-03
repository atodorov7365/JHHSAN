//
//  InfiniteCampusViewController.swift
//  JHHSAN
//
//  Created by student3 on 2/15/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class InfiniteCampusViewController: UIViewController {
    @IBOutlet weak var infiniteCampus: UIWebView!
    var urlString = "https://ic.d214.org/campus/portal/township_214.jsp"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
    }
    func loadAddressURL(){
        let requestUrl = NSURL(string: urlString)
        let request = NSURLRequest(url: requestUrl as! URL)
        infiniteCampus.loadRequest(request as URLRequest)
    }


   
}
