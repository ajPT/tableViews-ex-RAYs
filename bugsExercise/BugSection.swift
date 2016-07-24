//
//  BugSection.swift
//  bugsExercise
//
//  Created by Amadeu Andrade on 24/07/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class BugSection {
    
    var scaryFactor: ScaryFactor
    var bugs = [ScaryBug]()
    
    init(factor: ScaryFactor) {
        self.scaryFactor = factor
    }
    
}