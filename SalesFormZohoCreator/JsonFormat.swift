//
//  JsonFormat.swift
//  SalesFormZohoCreator
//
//  Created by Temp on 13/03/22.
//

import Foundation

struct Sale: Codable{
    var IME: String
    var Saled_Date: String
    var Employee: String
    var Mobile_Model: String
    var Mobile_Brand: String
    var Price: String
}

struct Order: Codable{
    var data: [Sale]
}

