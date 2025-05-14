//
//  HomeViewModel.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import Foundation

enum HomeViewState {
    case loading
    case loaded([Canteen])
    case error(DecodeError)
}

final class HomeViewModel: ObservableObject {
    
    private var allCanteens: [Canteen] = []
    
    @Published private(set) var state: HomeViewState = .loading
    
    private func updateState(_ state: HomeViewState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
    
    func fetchCanteens() {
        updateState(.loading)
        
        Task {
            do {
                let response: CanteenListResponse = try await DecodeService().request(.getCanteens)
                
                allCanteens = response.canteens
                updateState(.loaded(response.canteens))
                
            } catch let error as DecodeError {
                updateState(.error(error))
            } catch {
                updateState(.error(.unknown))
            }
        }
        
    }
}
