//
//  ContentView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Scopri")
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Scopri")
                }
            GardenView()
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Giardino")
                }
            Text("Profilo")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profilo")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
