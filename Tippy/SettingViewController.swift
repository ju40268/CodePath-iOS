//
//  SettingViewController.swift
//  Tippy
//
//  Created by Christina Chen on 9/3/18.
//  Copyright © 2018 Christie Chen. All rights reserved.
//

import UIKit
var lang = ["US Dollar", "Chinese RMB", "Japanese Yuan", "Taiwan New Dollar"]
var selectedIndex = 0
protocol DataPassBackDelegate {
    func userDidEnterInformation(info:String)
}
class SettingViewController: UITableViewController {
    var delegate:DataPassBackDelegate? = nil
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lang.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = lang[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let information:String = lang[indexPath.row]
        print(information)
        if (delegate != nil){
            delegate!.userDidEnterInformation(info: information)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
