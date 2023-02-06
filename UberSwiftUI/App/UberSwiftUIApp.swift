//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/01/31.
//

import SwiftUI

@main
struct UberSwiftUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
                .preferredColorScheme(.light)
        }
        
    }
}
