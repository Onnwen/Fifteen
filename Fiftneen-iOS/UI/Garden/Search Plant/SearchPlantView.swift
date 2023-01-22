//
//  SearchPlantView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 20/01/23.
//

import SwiftUI

struct SearchPlantView: View {
    @StateObject var model = DataModel()
    @State var searchedPlant: Plant?
    @State var search = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                search = true;
                PlantAnalyzer.search(image: (model.viewfinderImage?.asUIImage())!) { (plantInfo, error) in
                    if (plantInfo != nil) {
                        searchedPlant = plantInfo
                    }
                    else {
                        print(error!)
                    }
                }
            }) {
                CameraView(image: $model.viewfinderImage)
                    .background(
                        ProgressView()
                            .progressViewStyle(.circular)
                    )
                    .cornerRadius(20)
                    .padding(10)
                    .task {
                        await model.camera.start()
                    }
            }
            .sheet(isPresented: $search) {
                if (searchedPlant != nil) {
                    SearchPlantResultView(plant: searchedPlant!)
                }
                else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        }
        .padding(15)
        .navigationTitle("Cerca pianta")
    }
}

struct SearchPlantView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlantView()
    }
}
