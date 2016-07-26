//
//  ViewController+TableView.swift
//  bugsExercise
//
//  Created by Amadeu Andrade on 23/07/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Edit Btn
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            
            tableView.beginUpdates()
            for (index, set) in bugSect.enumerate() {
                let indexPath = NSIndexPath(forRow: set.bugs.count, inSection: index)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            tableView.endUpdates()
            
            tableView.setEditing(true, animated: false)
        } else {
            
            tableView.beginUpdates()
            for (index, set) in bugSect.enumerate() {
                let indexPath = NSIndexPath(forRow: set.bugs.count, inSection: index)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            tableView.endUpdates()
            
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
        
        if editingStyle == .Insert {
            let bugSection = bugSect[indexPath.section]
            let bug = ScaryBug(withName: "New NotScary Bug", imageName: nil, howScary: .NotScary)
            bugSection.bugs.append(bug)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        let section = bugSect[indexPath.section]
        if indexPath.row >= section.bugs.count {
            return .Insert
        }
        return .Delete
    }
    
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let set = bugSect[indexPath.section]
        
        if editing && indexPath.row < set.bugs.count {
            //normal cell, doesnt want to be selectable
            return nil
        }
        return indexPath
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let set = bugSect[indexPath.section]
        
        if editing && indexPath.row >= set.bugs.count {
            self.tableView(tableView, commitEditingStyle: .Insert, forRowAtIndexPath: indexPath)
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return bugSect.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bugSection = bugSect[section]
        let adjustment = editing ? 1 : 0
        return bugSection.bugs.count + adjustment
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let bugSection = bugSect[section]
        return ScaryBug.scaryFactorToString(bugSection.scaryFactor)
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("bugCell") {
            let bugSection = bugSect[indexPath.section]
            
            if indexPath.row >= bugSection.bugs.count && editing {
                cell.textLabel?.text = "Add a new bug"
                cell.detailTextLabel?.text = nil
                cell.imageView?.image = nil
                
            } else {
                let bug = bugSection.bugs[indexPath.row]
                
                cell.textLabel?.text = bug.name
                let howScary = ScaryBug.scaryFactorToString(bug.howScary)
                cell.detailTextLabel?.text = howScary
                if let img = bug.image {
                    cell.imageView?.image = img
                } else {
                    cell.imageView?.image = nil
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
}