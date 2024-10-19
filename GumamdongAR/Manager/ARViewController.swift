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
        let configuration = ARImageTrackingConfiguration()
        arView.session.run(configuration)
    }
}
