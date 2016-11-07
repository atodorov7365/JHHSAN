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
    var urlStringInfiniteCampus = "https://ic.d214.org/campus/portal/township_214.jsp"
    var urlStringDistrictEmail = "https://gapps.d214.org/"
    var urlStringMoodle = "http://moodle2.d214.org/"
    var appStringSchoology = "\\:schoology"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func heresyWebSite(_ sender: UIButton) {
        let url = NSURL(string: urlString)!
        UIApplication.shared.openURL(url as URL)
        //hersey activites
        //  (//:) = app
    }
    @IBAction func infiniteCampus(_ sender: UIButton) {
        let url = NSURL(string: urlStringInfiniteCampus)!
        UIApplication.shared.openURL(url as URL)
        //website
    }
    @IBAction func email(_ sender: UIButton) {
        let url = NSURL(string: urlStringDistrictEmail)!
        UIApplication.shared.openURL(url as URL)
    }
    
    @IBAction func moodle(_ sender: UIButton) {
        let url = NSURL(string: urlStringMoodle)!
        UIApplication.shared.openURL(url as URL)
    }
    @IBAction func schoology(_ sender: UIButton) {
        let url = NSURL(string: appStringSchoology)!
        UIApplication.shared.openURL(url as URL)

    }
    
}
