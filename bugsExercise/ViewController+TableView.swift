//
//  ViewController+TableView.swift
//  bugsExercise
//
//  Created by Amadeu Andrade on 23/07/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

extension ViewController {

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