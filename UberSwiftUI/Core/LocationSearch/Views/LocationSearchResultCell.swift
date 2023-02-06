//
//  LocationSearchResultCell.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/06.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 6)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
            
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "Starbucks", subtitle: "123 Main St, Cupertino CA")
    }
}
