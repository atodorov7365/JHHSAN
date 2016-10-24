//
//  SafariViewController.swift
//  JHHSAN
//
//  Created by student3 on 10/21/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import SafariServices


class SafariViewController: UIViewController, SFSafariViewControllerDelegate {
    var urlString = "http://jhhs.d214.org/co-curricular/activities/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func heresyWebSite(_ sender: UIButton) {
        let url = NSURL(string: urlString)!
        UIApplication.shared.openURL(url as URL)
    }
    
    
}
