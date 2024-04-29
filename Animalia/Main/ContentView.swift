//
//  ContentView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationStack{
            Group {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    ForEach(animal){ animal in
                        AnimalListItemView (animal: animal)
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Animalia")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content:{
                    HStack(spacing:16, content: {
                        //list
                        Button{
                            //to do isgridactive
                        }
                        label:{
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                        //grid
                        Button{
                            
                        }
                        label:{
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                    })
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
