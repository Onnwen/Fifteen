//
//  ViewfinderView.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import SwiftUI

struct CameraView: View {
    @Binding var image: Image?
    
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(image: .constant(Image(systemName: "pencil")))
    }
}
