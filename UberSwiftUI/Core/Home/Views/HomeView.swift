//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/01/31.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShownLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            if isShownLocationSearchView {
                LocationSearchView()
            } else {
                LocationSearchActivationView()
                    .padding(.top, 70)
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            isShownLocationSearchView.toggle()
                        }
                        
                    }
            }
            
            
                
            MapViewActionButton(isShownLocationSearchView: $isShownLocationSearchView)
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
