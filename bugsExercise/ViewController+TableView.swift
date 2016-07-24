//
//  ViewController+TableView.swift
//  bugsExercise
//
//  Created by Amadeu Andrade on 23/07/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

extension ViewController {
    
    //Edit Btn
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            tableView.setEditing(true, animated: false)
        } else {
            tableView.setEditing(false, animated: false)
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let bugSection = bugSect[indexPath.section]
            bugSection.bugs.removeAtIndex(indexPath.row)
            //Without animation:
            //tableView.reloadData()
            //With animation:
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return bugSect.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bugSection = bugSect[section]
        return bugSection.bugs.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let bugSection = bugSect[section]
        return ScaryBug.scaryFactorToString(bugSection.scaryFactor)
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("bugCell") {
            let bugSection = bugSect[indexPath.section]
            let bug = bugSection.bugs[indexPath.row]
            cell.textLabel?.text = bug.name
            let howScary = ScaryBug.scaryFactorToString(bug.howScary)
            cell.detailTextLabel?.text = howScary
            if let img = bug.image {
                cell.imageView?.image = img
            }
            return cell
        }
        return UITableViewCell()
    }
    
}