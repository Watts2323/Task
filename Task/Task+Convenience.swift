//
//  Task+Convenience.swift
//  Task
//
//  Created by Xavier on 10/10/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil){
        self.init(context: CoreDataStack.context)
        self.name = name
        self.isComplete = false
        self.notes = notes
        self.due = due
    
    }
}















