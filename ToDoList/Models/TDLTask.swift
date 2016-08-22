//
//  TDLTask.swift
//  ToDoList
//
//  Created by shuo yao on 8/21/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

class TDLTask: NSObject {
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
}
