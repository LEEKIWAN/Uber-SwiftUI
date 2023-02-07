//
//  RideRequestView.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/07.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 10)
            
            HStack {
                VStack {
                    Circle()
                        .foregroundColor(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .foregroundColor(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: 8, height: 8)
                }
                
                VStack {
                    HStack {
                        Text("Current location")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 28)
                    
                    
                    HStack {
                        Text("Current location")
                            .font(.callout)
                            .fontWeight(.semibold)
                     
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.leading, 8)

                
            }
            .padding()
            
            Divider()
            
            // Ride Select View
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(RideType.allCases) { rideType in
                        VStack(alignment: .leading) {
                            Image(systemName: rideType.imageName)
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                            VStack(alignment: .leading) {
                                Text(rideType.description)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                
                                Text("\(viewModel.calculateRidePrice(forType: rideType).toCurrency())")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                            .padding(.bottom)
                            
                        }
                        .frame(width: UIScreen.screenWidth / 3.4, height: 140)
                        .foregroundColor(Color( rideType == selectedRideType ? .white : .black))
                        .background(Color( rideType == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(rideType == selectedRideType ? 1.15 : 1)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation {
                                selectedRideType = rideType
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            
            Divider()
                .padding(.vertical, 8)
            
            // payment option view
            
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            
            // request ride button
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(.vertical, 4)
            
        }
        .background(content: {
            Rectangle()
                .fill(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
                .shadow(radius: 10, y: -10)
            
        })

    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            Spacer()
            RideRequestView()
        }
        
            
    }
}
