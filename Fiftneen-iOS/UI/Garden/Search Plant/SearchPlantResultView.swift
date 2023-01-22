//
//  SearchPlantResultView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import SwiftUI

struct SearchPlantResultView: View {
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
                    Text("Ciao")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Chiudi") {
                                    print("Pressed")
                                }
                            }
                            
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Aggiugni") {
                                    print("Pressed")
                                }
                            }
                        }
                }
            }
            .navigationTitle(completed ? "Pero" : "Analisi in corso")
        }
    }
}

struct SearchPlantResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlantResultView()
    }
}
