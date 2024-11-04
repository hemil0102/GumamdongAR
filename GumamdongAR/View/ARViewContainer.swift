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
                    if let model = createMarker() {
                        print(imageAnchor)
                        let anchorEntity = AnchorEntity(anchor: imageAnchor)
                        //anchorEntity.transform = Transform(matrix: imageAnchor.transform) 이 줄이 불필요 
                        anchorEntity.addChild(model)
                        ARViewController.shared.arView.scene.addAnchor(anchorEntity)
                    }
                }
            }
        }
        
        func createMarker() -> ModelEntity? {
            let boxResource = MeshResource.generateBox(size: 0.1)
            let myMaterial = SimpleMaterial(color: .blue, isMetallic: true)
            let myEntity = ModelEntity(mesh: boxResource, materials: [myMaterial])
    
            return myEntity
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
