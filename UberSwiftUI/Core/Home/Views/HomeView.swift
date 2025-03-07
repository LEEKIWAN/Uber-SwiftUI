//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/01/31.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @State private var mapState = MapViewState.noInput
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState )
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 70)
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                            
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            
            if mapState == .locationSelected {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                print("DEBUG: User location in home view is \(location)")
                
                viewModel.userLocation = location
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationSearchViewModel())
    }
}
