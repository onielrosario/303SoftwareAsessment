//
//  _03SoftwareAssesmentTests.swift
//  303SoftwareAssesmentTests
//
//  Created by Oniel Rosario on 8/7/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import XCTest
@testable import _03SoftwareAssesment

class _03SoftwareAssesmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetJSONData() {
        let exp = expectation(description: "got data")
       guard let url = URL(string: "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true") else { return }
        URLSession.shared.dataTask(with: url) { (data, response ,error)  in
            if let error = error {
               XCTFail("error in the url \(error)")
            } else if let _ = data {
               exp.fulfill()
                }
            }.resume()
        wait(for: [exp], timeout: 3.0)
    }
}
