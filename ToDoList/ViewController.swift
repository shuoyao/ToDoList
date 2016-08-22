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
    let listNames = ["First List", "Second List", "Target List", "J.Crew List"]
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
        cell.listNameLabel?.text = self.listNames[indexPath.row]
        return cell
    }

}

