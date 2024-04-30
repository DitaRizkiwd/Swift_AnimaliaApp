//
//  MapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //Mark: - region
    @State private var region: MKCoordinateRegion = {
        //center map
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        //span map atau zoom level
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        //mapp region
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
    }()
//properties
    let location: [LocationModel] = Bundle.main.decode("locations.json")
    
    var body: some View {
        ZStack(alignment: .top){
            //basic
//            Map(coordinateRegion: $region)
            
        //advance
            Map(coordinateRegion: $region, annotationItems: location){
                item in
                //                MapPin(coordinate: item.location, tint: .accent)
                //            }
                
                //marker: new style map statis
//                MapMarker(coordinate: item.location, tint: .accent)
                
                    //custom basic map
//                MapAnnotation(coordinate: item.location) {
//                    Image(.logo)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32)
//                }
                
                //advance annotation
                MapAnnotation(coordinate: item.location){
                    MapAnnotationView(location: item)
                }
            }
            //map
            
            Group {
                HStack(spacing:12){
                    Image(.compass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    VStack{
                        HStack{
                            Text("Latitude: ")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        Divider()
                        HStack{
                            Text("Longitude: ")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(0.55)
            )
            }
            .padding()
        }
    }
}

#Preview {
    MapView()
}
