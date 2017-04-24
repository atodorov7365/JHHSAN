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
        var True = 1
        TableArray = ["JHHS Schedule", "JHHS Website", "JHHS Map","JHHS Handbook","D214 School Locations","JHHS Activites","Infinite Campus","JHHS Email","Moodle"]
        while(True == 1){
        if TableArray[0].characters.count <= TableArray[1].characters.count{
            print(TableArray[1])
        }
        else {
            print(TableArray[0])
        }
        if TableArray[2].characters.count <= TableArray[3].characters.count{
            print(TableArray[3])
        }
        else {
            print(TableArray[2])
        }
        if TableArray[4].characters.count <= TableArray[5].characters.count{
            print(TableArray[5])
        }
        else {
            print(TableArray[4])
        }
        if TableArray[6].characters.count <= TableArray[7].characters.count{
            print(TableArray[7])
        }
        else {
            print(TableArray[6])
        }
        if TableArray[7].characters.count <= TableArray[8].characters.count{
            print(TableArray[8])
        }
    True+=1
    }
//        for var x = 0;x>TableArray.count;x+=1 {
//            if TableArray[x] <= TableArray[y]{
//                print(TableArray[x])
//                
//            }
//            else{
//                print(TableArray[y])
//            }
//            //x+=1
//            y+=1
//        }

        
        //sort code by length
        //TableArray.sort()
        //8 strings
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TableArray[indexPath.row], for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
   

}
