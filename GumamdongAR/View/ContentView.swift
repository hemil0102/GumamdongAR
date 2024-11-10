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
            ARViewContainer()
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                if let coordinate = gpsManager.coordinate {
                    Text("현재 기기 좌표: \(coordinate.latitude), \(coordinate.longitude)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.5))
                }
            }
        }
    }
}


