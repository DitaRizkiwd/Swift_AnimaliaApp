//
//  ContentView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [
        GridItem(.flexible())
    ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //Mark: - FUNCTION GRID SWITCH
    func gridSwitch(){
        withAnimation(.easeIn){
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print(gridColumn)
        }
        
        //toolbar image
        switch gridColumn{
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3 :
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    
    var body: some View {
        NavigationStack{
            Group {
                
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animal){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView (animal: animal)
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView(showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12, content: {
                            ForEach(animal){ animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        })
                    })
                }
                
            }
            .navigationTitle("Animalia")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content:{
                    HStack(spacing:16, content: {
                        //Mark: - list

                        Button{
                            print("List view is avtivated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }
                        label:{
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accent)
                        }
                        //Mark: - grid

                        Button{
                            print("grid view is activated")
                            isGridViewActive = true
                            gridSwitch()
                            haptics.impactOccurred()
                        }
                        label:{
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accent : .primary)
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
