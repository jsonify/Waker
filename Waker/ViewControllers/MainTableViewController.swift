//
//  MainTableViewController.swift
//  Waker
//
//  Created by Jason on 6/8/18.
//  Copyright © 2018 Jason Rueckert. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    let itemArray = ["Wake Up Time", "PreWake Up Duration", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
