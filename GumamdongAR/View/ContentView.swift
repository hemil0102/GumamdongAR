//
//  ContentView.swift
//  GumamdongAR
//
//  Created by YEHROEI HO on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ARViewContainer()
                .ignoresSafeArea()
            
            Button(action: {
                print("버튼 눌림")
            }, label: {
                Text("증강하기")
                    .frame(maxHeight: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
            })

        }
    }
}

#Preview {
    ContentView()
}
