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
     getPeople()
    setupUI()
    }

    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getPeople() {
        APIClient.GetJSONData { (people, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let people = people {
                self.people = people
            }
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? TableViewCell else { return UITableViewCell() }
        let person = people[indexPath.row]
        // cache data to minimize API Call
        let cache = NSCache<NSString, Person>()
        if let dataCached = cache.object(forKey: "dataCached") {
            cell.configureCell(person: dataCached)
        } else {
            cell.configureCell(person: person)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
