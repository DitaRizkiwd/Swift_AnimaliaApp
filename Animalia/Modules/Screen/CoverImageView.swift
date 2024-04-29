//
//  CoverImageView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    let coverImage: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImage){
                item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
