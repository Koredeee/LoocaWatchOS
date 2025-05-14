//
//  HomeModel.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import Foundation

struct CanteenListResponse: Hashable, Decodable {
    let canteens: [Canteen]
}

struct Canteen: Hashable, Decodable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let estimationInMin: Int
    let distanceInMeters: Int
    let directions: [Direction]
}

struct Direction: Hashable, Codable {
    var id: Int
    var description: String
    var afterMeters: Int
    var latitude: Double
    var longitude: Double
}
