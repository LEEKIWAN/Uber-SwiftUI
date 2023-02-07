//
//  LocationSearchViewModel.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/06.
//

import SwiftUI
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    @Published var results: [MKLocalSearchCompletion] = []
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    var userLocation: CLLocationCoordinate2D?
    
    private var searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet {            
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    // MARK: - Life Cycle
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
        // MARK: - Helper
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            
            
            self.selectedLocationCoordinate = coordinate
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func calculateRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedLocationCoordinate else { return 0 }
        guard let userCoordinate = userLocation else { return 0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destLocation = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destLocation)
        
        
        return type.calculatePrice(for: tripDistanceInMeters)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print(completer.results)
        self.results = completer.results
    }
}
