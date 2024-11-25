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
    @ObservedObject var gpsManager = GPSManager()
    
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
                        model.position.y = 0.2
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
        
        func removeAllAnchors() {
            ARViewController.shared.arView.scene.anchors.removeAll()
        }
    }
    
    // 맨 처음에 한번만 호출 되어서 화면을 만든다.
    func makeUIView(context: Context) -> ARView {
        return ARViewController.shared.arView
    }
    
    // SwiftUI의 데이터 상태가 변경될 때마다 호출한다.
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let distance = gpsManager.getDisitance()
        if distance < 10 {
            ARViewController.shared.startARSession()
        } else {
            ARViewController.shared.stopImageTracking()
        }
    }
    
    func makeCoordinator() -> Coordinator {
      return Coordinator()
    }
}
