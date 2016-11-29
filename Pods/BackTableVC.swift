//
//  BackTableVC.swift
//  Pods
//
//  Created by student3 on 11/21/16.
//
//
import UIKit

import Foundation

class BackTableVC: UITableViewController{
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Hello", "Second", "World"]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
}
