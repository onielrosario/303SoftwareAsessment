//
//  TableViewCell.swift
//  303SoftwareAssesment
//
//  Created by Oniel Rosario on 8/7/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    func configureCell(person: Person) {
        firstNameLabel.text = person.fname
        lastNameLabel.text = person.lname
        cityLabel.text = person.city
    }

}
