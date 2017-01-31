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
    var urlString = "http://jhhs.d214.org/co-curricular/activities/"

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func herseyActivityWebsite(_ sender: UIButton) {
        let url = NSURL(string: urlString)!
        UIApplication.shared.openURL(url as URL)
    }

    

}
