//
//  InsetGalleryView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 16){
                ForEach(animal.gallery, id: \.self){
                    item in
                    Image(item)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        })
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return InsetGalleryView(animal: animals[6])
        
}
