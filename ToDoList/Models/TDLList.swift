//
//  TDLList.swift
//  ToDoList
//
//  Created by shuo yao on 8/21/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

class TDLList: NSObject {
    let listName: String
    var tasks: [TDLTask]
    
    init(withListName listName:String) {
        self.listName = listName
        self.tasks = []
    }
    
    func listLength() -> Int {
        return self.tasks.count
    }
    
}
