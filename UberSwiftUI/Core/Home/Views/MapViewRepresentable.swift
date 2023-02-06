//
//  MapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/01/31.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    
    let mapView: MKMapView = MKMapView()
//    let locationManager = LocationManager()
    
    
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: .init(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                                            span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            print(userLocation.location)
            
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
