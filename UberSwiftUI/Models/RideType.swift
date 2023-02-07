//
//  RideType.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/07.
//

import SwiftUI

enum RideType: Int, CaseIterable, Identifiable {
    var id: Int {
        return rawValue
    }
    
    case uberX
    case black
    case uberXL
    
    
    var description: String {
        switch self {
        case .uberX:
            return "UbserX"
        case .black:
            return "UberBlack"
        case .uberXL:
            return "UbserXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX:
            return "car"
        case .black:
            return "car"
        case .uberXL:
            return "car"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX:
            return 4000
        case .black:
            return 8000
        case .uberXL:
            return 5000
        }
    }
    
    func calculatePrice(for distanceInMeter: Double) -> Double {
        switch self {
        case .uberX:
            return distanceInMeter / 1000 * 1000 + baseFare
        case .black:
            return distanceInMeter / 1000 * 1500 + baseFare
        case .uberXL:
            return distanceInMeter / 1000 * 1200 + baseFare
        }
    }
}
