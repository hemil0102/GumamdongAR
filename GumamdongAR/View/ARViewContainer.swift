//
//  ARViewContainer.swift
//  GumamdongAR
//
//  Created by YEHROEI HO on 10/19/24.
//

import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        ARViewController().arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
