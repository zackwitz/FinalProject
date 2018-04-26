//
//  Trip.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/26/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import Foundation

class Trip {
    
    var startLocation: String
    var endLocation: String
    var startDate: String
    var endDate: String
    var hotel: String
    
    init(startLocation: String, endLocation: String, startDate: String, endDate: String, hotel: String) {
        self.startLocation = startLocation
        self.endLocation = endLocation
        self.startDate = startDate
        self.endDate = endDate
        self.hotel = hotel
    }
    
}
