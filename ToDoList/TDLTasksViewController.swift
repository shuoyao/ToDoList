//
//  TDLTasksViewController.swift
//  ToDoList
//
//  Created by Andrew Lauer Barinov on 8/27/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

class TDLTasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let taskCellReuseIdentifier = "TDLTaskCellReuseIdentifier"
    var list: TDLList = TDLList(withListName: "List")
    @IBOutlet var tableview: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    @IBAction func displayAddTaskAlertView(sender: UIBarButtonItem) {
        var inputTextfield: UITextField?
        
        let alertViewController = UIAlertController(title: "Please enter task name", message: nil, preferredStyle: .Alert)
        alertViewController.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Task Name"
            inputTextfield = Optional(textField)
        })
        let okAction = UIAlertAction(title: "Create Task", style: .Default, handler:({ (action) -> Void in
            self.addTaskWithName(inputTextfield?.text)
            self.tableview?.reloadData()
        }))
        
        alertViewController.addAction(okAction)
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    func addTaskWithName(taskName: String?) {
        if let unwrappedTaskName = taskName {
            let task = TDLTask(withTaskName: unwrappedTaskName, taskNote: "")
            self.list.addTask(task)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.listLength()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(taskCellReuseIdentifier, forIndexPath: indexPath) as! TDLTaskTableViewCell
        let task = self.list.tasks[indexPath.row]
        
        if task.completed {
            let check = "✓"
            cell.taskDescriptionLabel?.text = "\(check) \(task.taskName)"
        } else {
            let box = "▢"
            cell.taskDescriptionLabel?.text = "\(box) \(task.taskName)"
        }
        
        return cell
    }
}
