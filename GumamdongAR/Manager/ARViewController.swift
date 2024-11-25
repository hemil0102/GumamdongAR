//
//  ARViewController.swift
//  GumamdongAR
//
//  Created by YEHROEI HO on 10/19/24.
//

import SwiftUI
import ARKit
import RealityKit

final class ARViewController: ObservableObject {
    static let shared = ARViewController()
    
    @Published var arView: ARView
    
    init() {
        self.arView = ARView(frame: .zero)
    }
    
    public func startARSession() {
        startImageDetection()
    }
    
    private func startImageDetection() {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("이미지 추적 파일을 불러오는 것에 실패했습니다.")
        }
        
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = referenceImages
        arView.session.run(configuration)
    }
    
    public func stopImageTracking() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = nil
        arView.session.run(configuration, options: .removeExistingAnchors)
    }
}
