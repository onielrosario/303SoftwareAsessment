//
//  ViewController.swift
//  303SoftwareAssesment
//
//  Created by Oniel Rosario on 8/7/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//


/*
 Will build the UI on stoyboard instead of programmatically.
 */

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var people = [Person]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

