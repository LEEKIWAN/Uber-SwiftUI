//
//  LocationSearchActivationView.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/01.
//

import SwiftUI

struct LocationSearchActivationView: View {
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 7, height: 7)
                .padding() 
            Text("Where to go?")
                .foregroundColor(Color(.darkGray))
            Spacer()
        }
        .frame(width: UIScreen.screenWidth - 50, height: 50)
        .background {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 6)
                
        }
        .opacity(0.9)
        
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
