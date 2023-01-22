//
//  SearchPlantResultView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import SwiftUI

struct SearchPlantResultView: View {
    @Environment(\.dismiss) var dismiss
    var plant: Plant = Plant(name: "Tomato", imageURL: URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/440px-Tomato_je.jpg")!, scientificName: "Tomatoes", propagationMethods: ["Semi", "Foglie"], synonyms: [""], url: URL(string:"https://en.wikipedia.org/wiki/Tomato")!)
    @State var completed = true
    
    var body: some View {
        NavigationView {
            VStack {
                if (!completed) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Chiudi") {
                                    print("Pressed")
                                }
                            }
                        }
                }
                else {
                    VStack {
                        Spacer()
                        
                        AsyncImage(url: plant.imageURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .padding()
                        } placeholder: {
                            ProgressView()
                                .frame(width: 200, height: 200)
                        }
                
                        Text(plant.scientificName)
                            .font(.title)
                    
                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Chiudi") {
                                dismiss()
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Aggiungi") {
                                print("Pressed")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("")
        }
    }
}

struct SearchPlantResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlantResultView()
    }
}
