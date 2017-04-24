//  Endri Shkembi's Code
//  MoodleViewController.swift
//  JHHSAN
//
//  Created by student3 on 2/15/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class MoodleViewController: UIViewController {
    @IBOutlet weak var moodleWebView: UIWebView!
    var urlString = "http://moodle2.d214.org/"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
    }
    func loadAddressURL(){
        let requestUrl = NSURL(string: urlString)
        let request = NSURLRequest(url: requestUrl as! URL)
        moodleWebView.loadRequest(request as URLRequest)
    }

}
