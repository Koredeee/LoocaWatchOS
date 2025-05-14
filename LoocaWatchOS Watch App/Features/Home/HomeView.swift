//
//  ContentView.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.state {
                case .loading:
                    Text("Loading...")
                case .loaded(let canteens):
                    List(canteens, id: \.name) { canteen in
                        HStack {
                            VStack {
                                Text(canteen.name.capitalized)
                                Text("\(canteen.estimationInMin.description) min · \(canteen.distanceInMeters.description) m")
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            navigationPath.append(canteen)
                        }
                    }
                case .error(let decodeError):
                    Text("Error: \(decodeError.errorDescription ?? "")")
                }
            }
            .navigationDestination(for: Canteen.self) { selected in
//                DetailView(viewModel: DetailViewModel(pokemon: selected))
            }
        }
        .onAppear {
            viewModel.fetchCanteens()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
