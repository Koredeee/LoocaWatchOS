//
//  DecodeService.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import Foundation

final class DecodeService {
    /*func request<T: Decodable>(_ path: DecodePath) async throws -> T {
        guard let fileName = path.localFileName else {
            throw DecodeError.unknown
        }
        
        return try loadLocalJSON(filename: fileName)
    }*/
    
    func request<T: Decodable>(_ path: DecodePath) async throws -> T {
            switch path {
            case .getCanteens:
                return try loadLocalJSON(filename: "looca_data")
            case .getCanteenDirection(fileName: let fileName):
                throw DecodeError.unknown
            }
        }
    
    private func loadLocalJSON<T: Decodable>(filename: String) throws -> T {
        guard let localJSON = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw DecodeError.decodingError
        }
        
        do {
            let data = try Data(contentsOf: localJSON)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw DecodeError.decodingError
        }
    }
}
