//
//  DecodeError.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import Foundation

enum DecodeError: Error, LocalizedError {
    case decodingError
    case unknown

    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the file"
        case .unknown:
            return "An unknown error occurred"
        }
    }
}
