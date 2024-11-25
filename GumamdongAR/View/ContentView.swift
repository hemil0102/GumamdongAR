//
//  ContentView.swift
//  GumamdongAR
//
//  Created by YEHROEI HO on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gpsManager = GPSManager()
    
    var body: some View {
        ZStack {
            ARViewContainer().ignoresSafeArea()
            
            VStack {
                Spacer()
                
                if let coordinate = gpsManager.coordinate, let targetCoordinates = gpsManager.targetCoordinate {
                    VStack(alignment: .leading) {
                        Text("특정 위치: \(String(format: "%.6f", targetCoordinates.latitude)), \(String(format: "%.6f", targetCoordinates.longitude))")
                        Text("현재 기기 좌표: \(String(format: "%.6f", coordinate.latitude)), \(String(format: "%.6f", coordinate.longitude))")
                        Text("특정지점과의 거리: \(gpsManager.getDisitance())")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.black.opacity(0.5))
                }
            }
        }
    }
}


