//
//  APIClient.swift
//  303SoftwareAssesment
//
//  Created by Oniel Rosario on 8/7/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

//API CALL METHODS

final class APIClient {
    //get method
    static func GetJSONData(completionHandler: @escaping([Person]?, Error?)-> Void) {
        //url returns an array of people data (firtname, lastname, location city)
        guard let url = URL(string: "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true") else { return }
        URLSession.shared.dataTask(with: url) { (data, response ,error)  in
            if let error = error {
                //catch the error
                completionHandler(nil, error)
            } else if let data = data {
                do {
                    let people = try JSONDecoder().decode([Person].self, from: data)
                    //got data
                    completionHandler(people, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
}
