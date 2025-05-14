//
//  DecodePath.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import Foundation

enum DecodePath {
    case getCanteens
    case getCanteenDirection(fileName: String)

    var localFileName: String? {
        switch self {
        case .getCanteens:
            return "looca_data" // maps to looca_data.json
        case .getCanteenDirection(let fileName):
            return fileName
        }
    }
}
