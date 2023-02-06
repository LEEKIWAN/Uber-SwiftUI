//
//  MapViewActionButton.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/01.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var isShownLocationSearchView: Bool
    
    var imageName: String {
        return isShownLocationSearchView ? "arrow.left" : "line.3.horizontal"
    }
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                isShownLocationSearchView.toggle()
            }
        } label: {
            Image(systemName: imageName)
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(isShownLocationSearchView: .constant(true))
    }
}
