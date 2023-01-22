//
//  HomeView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 20/01/23.
//

import SwiftUI

struct GardenView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Nessuna pianta salvata")
            }
            .navigationTitle("Giardino")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: SearchPlantView()) {
                        Text("Aggiungi")
                    }
                }
            }
        }
    }
}

struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenView()
    }
}
