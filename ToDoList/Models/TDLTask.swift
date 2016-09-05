//
//  TDLTask.swift
//  ToDoList
//
//  Created by shuo yao on 8/21/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

public class TDLTask: NSObject, NSCoding {
    let taskName: String
    let expirationDate: NSDate
    let taskNote: String
    var starred: Bool = false
    var completed: Bool = false
    
    init(withTaskName taskName:String, expirationDate:NSDate, taskNote:String) {
        self.taskName = taskName
        self.expirationDate = expirationDate
        self.taskNote = taskNote
    }
    
    convenience init(withTaskName taskName:String, taskNote:String) {
        let expirationDate = NSDate.distantFuture()
        self.init(withTaskName: taskName, expirationDate: expirationDate, taskNote: taskNote)
    }
    
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.taskName, forKey: "taskName")
        aCoder.encodeObject(self.expirationDate, forKey: "expirationDate")
        aCoder.encodeObject(self.taskNote, forKey: "taskNote")
        aCoder.encodeObject(self.starred, forKey: "starred")
        aCoder.encodeObject(self.completed, forKey: "completed")
    }
    
    
    required convenience public init?(coder aDecoder: NSCoder) {
        guard let taskName = aDecoder.decodeObjectForKey("taskName") as? String,
        let expirationDate = aDecoder.decodeObjectForKey("expirationDate") as? NSDate,
        let taskNote = aDecoder.decodeObjectForKey("taskNote") as? String,
        let starred = aDecoder.decodeObjectForKey("starred") as? Bool,
            let completed = aDecoder.decodeObjectForKey("completed") as? Bool else {
                return nil
        }
        self.init(withTaskName: taskName, expirationDate: expirationDate, taskNote: taskNote)
        self.starred = starred
        self.completed = completed
    }
}
