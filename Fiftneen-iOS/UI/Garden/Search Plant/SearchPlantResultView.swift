//
//  SearchPlantResultView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import SwiftUI

struct SearchPlantResultView: View {
    @Environment(\.dismiss) var dismiss
    var result: Result
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                /*
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
                 */
                
                Text(result.suggestions.first?.plantDetails.commonNames?.first?.capitalized ?? result.suggestions.first?.name ?? "Nessuna pianta identificata")
                    .font(.title)
                Text(result.suggestions.first?.plantDetails.scientificName ?? "")
                    .font(.caption)
                
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
            .navigationBarTitle("")
        }
    }
}

/*
 struct SearchPlantResultView_Previews: PreviewProvider {
 static var previews: some View {
 SearchPlantResultView()
 }
 }
 */
