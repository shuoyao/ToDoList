//
//  ViewController.swift
//  ToDoList
//
//  Created by shuo yao on 8/21/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let listCellReuseIdentifier = "TDLListCellReuseIdentifier"
    lazy var listNames: [TDLList] = {
        return [TDLList(withListName: "First List"),
                TDLList(withListName: "Second List"),
                TDLList(withListName: "Target List"),
                TDLList(withListName: "J. Crew List")]
    }()
    
    @IBOutlet var tableview: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCellReuseIdentifier, forIndexPath: indexPath) as! TDLListCellTableViewCell
        let list = self.listNames[indexPath.row]
        cell.listNameLabel?.text = list.listName
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedList = self.listNames[indexPath.row]
        self.performSegueWithIdentifier("ShowTasksViewController", sender: selectedList)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "ShowTasksViewController" {
                if let viewController = segue.destinationViewController as? TDLTasksViewController {
                    if let unwrappedSender = sender as? TDLList {
                        viewController.list = unwrappedSender
                    }
                }
            }
        }
    }
    
    @IBAction func displayListNameAlertView(sender: UIBarButtonItem) {
        var inputTextfield: UITextField?
        
        let alertViewController = UIAlertController(title: "Please enter list name", message: nil, preferredStyle: .Alert)
        alertViewController.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "List Name"
            inputTextfield = Optional(textField)
        })
        let okAction = UIAlertAction(title: "Create List", style: .Default, handler:({ (action) -> Void in
            self.addListWithName(inputTextfield?.text)
            self.tableview?.reloadData()
        }))
        
        alertViewController.addAction(okAction)
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    func addListWithName(listName: String?) {
        if let unwrappedListName = listName {
            let list = TDLList(withListName: unwrappedListName)
            self.listNames.append(list)
        }
    }
    
    
}

