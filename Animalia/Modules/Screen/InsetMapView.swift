//
//  InsetMapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
//    @State private var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422), span: MKCoordinateSpan(latitudeDelta: 0.2 , longitudeDelta: 0.2)))
    @State private var cameraPosition: MapCameraPosition = {
            let centerCoordinate = CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422)
            
            let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            
            let region = MKCoordinateRegion(center: centerCoordinate, span: coordinateSpan)
            
            return MapCameraPosition.region(region)
        }()
    //latitude 4.17727, longitude 113.99422
    var body: some View {
        //        Map{
        //            Marker("Borneo", coordinate: .borneo)
        //        }
        ZStack (alignment: .topTrailing){
            Map(position: $cameraPosition)
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            HStack{
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                
                Text("Locations")
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(Color.black .opacity(0.4).clipShape(RoundedRectangle(cornerRadius: 8)))
            .padding(12)
            
        }
        
    }
}

#Preview {
    InsetMapView()
}
