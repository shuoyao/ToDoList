//
//  NSFileManager+ListUtilities.swift
//  ToDoList
//
//  Created by shuo yao on 9/4/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import Foundation

extension NSFileManager {
    func tdl_savedListsFilePath () -> String {
        let paths:[String] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let unwrappedPath = paths.first {
            return unwrappedPath.stringByAppendingString("/SavedLists.plist")
        } else {
            return ""
        }
    }
    
    func tdl_writeSave(lists: [TDLList]) {
        let path = self.tdl_savedListsFilePath()
        let didArchive = NSKeyedArchiver.archiveRootObject(lists, toFile: path)
        assert(didArchive)
    }
    
    func tdl_savedLists() -> [TDLList]? {
        let wrappedSavedLists = NSKeyedUnarchiver.unarchiveObjectWithFile(self.tdl_savedListsFilePath())
        
        guard let savedLists = wrappedSavedLists as? [TDLList] else { return nil }
        return savedLists
    }
    
}
