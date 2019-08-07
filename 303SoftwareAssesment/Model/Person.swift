//
//  Person.swift
//  303SoftwareAssesment
//
//  Created by Oniel Rosario on 8/7/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation


//json model
//will use class insetead of struct to can be able to cache
class Person: Codable {
    let fn: String
    let ln: String
    let city: String
}
