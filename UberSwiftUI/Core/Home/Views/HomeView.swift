//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/01/31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.top, 70)
                
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
