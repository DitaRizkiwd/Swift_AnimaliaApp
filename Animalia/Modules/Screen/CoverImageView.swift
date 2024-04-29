//
//  CoverImageView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    @State private var showingSheet = false
    @State private var selectedCover: CoverImageModel?
    
    
    let coverImage: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImage){
                item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                        showingSheet.toggle()
                        selectedCover = item
                    }
            }
            .sheet(isPresented: $showingSheet, content: {
                if let selectedCover = selectedCover{
                    OctagonImageFrame(cover: selectedCover)
                        .presentationDetents([.medium, .large])
//                   Image(selectedCover.name)
//                        .resizable()
//                        .scaledToFill()
                }
//                    .presentationDetents([.medium, .large])
                    
            })
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
