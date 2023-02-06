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
    
    private var searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet {
//            print("DEBUG: Query fragment is \(queryFragment)")
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
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print(completer.results)
        self.results = completer.results
    }
}
