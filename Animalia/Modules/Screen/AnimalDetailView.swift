//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            //Hero Image
            Image(animal.image)
                . resizable()
                .scaledToFit()
            
            //title
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
            //.underline(color : .accent)
                .background(
                    Color.accent
                        .frame(height: 6)
                        .offset(y:24))
            //headline
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled" , headingText: "Wilderness in pictures")
                InsetGalleryView(animal: animal)
            }
            .padding(.horizontal)
            
            Group{
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    .padding()
                InsetFactView(animal: animal)
            }
            
            
            //description
            Group{
                HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                Text(animal.description)
                    
            }
            .padding(.horizontal)
            
            
            //map
            Group{
                HeadingView(headingImage: "map", headingText: "National Parks")
                
                InsetMapView()
            }
            .padding(.horizontal)
            
        })
        .navigationTitle("Learn About \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationStack{
        AnimalDetailView(animal: animals[0])
    }
    
}
