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
    
    class Coordinator: NSObject, ARSessionDelegate {
        override init() {
            super.init()
            ARViewController.shared.arView.session.delegate = self
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                if let imageAnchor = anchor as? ARImageAnchor {
                    print(imageAnchor)
                }
            }
        }
    }
    
    func makeUIView(context: Context) -> ARView {
        ARViewController.shared.startARSession()
        return ARViewController.shared.arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
      return Coordinator()
    }
}
