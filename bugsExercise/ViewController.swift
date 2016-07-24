//
//  ViewController.swift
//  bugsExercise
//
//  Created by Amadeu Andrade on 23/07/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var bugSect = [BugSection]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBugs()
    }

    func setupBugs() {
        let notScarySection = BugSection(factor: .NotScary)
        let aLittleScarySection = BugSection(factor: .ALittleScary)
        let averageScarySection = BugSection(factor: .AverageScary)
        let quiteScarySection = BugSection(factor: .QuiteScary)
        let aiiiiieeeeeSection = BugSection(factor: .Aiiiiieeeee)
                
        bugSect.append(notScarySection)
        bugSect.append(aLittleScarySection)
        bugSect.append(averageScarySection)
        bugSect.append(quiteScarySection)
        bugSect.append(aiiiiieeeeeSection)
        
        let bugs = ScaryBug.bugs()
        
        for bug in bugs {
            let bugSection = bugSect[bug.howScary.rawValue]
            bugSection.bugs.append(bug)
        }
        
    }
    


}

