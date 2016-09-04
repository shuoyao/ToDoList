//
//  TDLList.swift
//  ToDoList
//
//  Created by shuo yao on 8/21/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

public class TDLList: NSObject, NSCoding {
    let listName: String
    var tasks: [TDLTask]
    
    init(withListName listName:String) {
        self.listName = listName
        self.tasks = []
    }
    
    func listLength() -> Int {
        return self.tasks.count
    }
    
    func addTask(task: TDLTask) {
        self.tasks.append(task)
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.listName, forKey: "listName")
        aCoder.encodeObject(self.tasks, forKey: "tasks")
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        guard let listName = aDecoder.decodeObjectForKey("listName") as? String,
              let tasks = aDecoder.decodeObjectForKey("tasks") as? [TDLTask] else {
                return nil
        }
        
        self.init(withListName: listName)
        self.tasks = tasks
    }
    
}
