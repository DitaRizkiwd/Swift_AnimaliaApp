//
//  InsetMapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
   
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    //latitude 4.17727, longitude 113.99422
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

#Preview {
    InsetMapView()
}
