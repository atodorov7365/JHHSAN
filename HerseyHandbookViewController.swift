//
//  HerseyHandbookViewController.swift
//  JHHSAN
//
//  Created by student3 on 10/25/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import SystemConfiguration
import SafariServices

class HerseyHandbookViewController: UIViewController {
    @IBAction func toHerseyHandbook(_ sender: UIButton) {
        let url  = URL(string: "http://jhhs.d214.org/assets/5/6/JHHS_Handbook_16-17.pdf") // Change the URL with your URL Scheme
        //Hersey handbook
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
        
    }
    @IBAction func toHerseyParentHandbook(_ sender: UIButton) {
        let url  = URL(string: "http://www.d214.org/assets/1/6/2016-17_District_214_Student___Parent_Handbook3.pdf") // Change the URL with your URL Scheme
        //District handbook
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        
        
        
    }
}
