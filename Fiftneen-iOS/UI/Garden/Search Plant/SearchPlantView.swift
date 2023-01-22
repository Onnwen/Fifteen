//
//  SearchPlantView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 20/01/23.
//

import SwiftUI

struct SearchPlantView: View {
    @State var search = false
    
    var body: some View {
            VStack(spacing: 20) {
                Button {
                    search = true;
                } label: {
                  CameraView()
                        .cornerRadius(10)
                }
                .sheet(isPresented: $search) {
                    SearchPlantResultView()
                }
            }
            .padding(15)
            .navigationTitle("Cerca pianta")
    }
    
    func analysePlant() {
        print("Ciao")
    }
}

struct SearchPlantView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlantView()
    }
}
