//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Alfredo Colon on 7/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import CoreData
import Foundation

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

extension Task {
    @discardableResult convenience init(
                    complete: Bool = false,
                    context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                    identifier: UUID = UUID(),
                    name: String,
                    notes: String? = nil,
                    priority: TaskPriority = .normal
    ) {
        self.init(context: context)
        self.complete = complete
        self.identifier = identifier
        self.name = name
        self.notes = notes
        self.priority = priority.rawValue
    }
}
