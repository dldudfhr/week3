//
//  ContentView.swift
//  week03
//
//  Created by 공학관559 on 9/21/26.
//

import SwiftUI

struct ContentView: View {
    private let images = ["a", "b", "g", "s"]
    private let names  = ["사과", "바나나", "포도", "딸기"]
    @State private var fitMode = true  
    @State private var selectedImage = 0
    var body: some View {
        Group {
            if fitMode {
                Image(images[selectedImage])
                    .resizable()
                    .scaledToFit()
            } else {
                Image(images[selectedImage])
                    .resizable()
                    .scaledToFill()
                    .clipped()          // Fill 에서는 넘친 부분을 잘라야 한다
            }
        }
        .frame(height: 200)
        .border(.gray.opacity(0.4)) 
        Picker("사진", selection: $selectedImage) {
            ForEach(images.indices, id: \.self) { i in
                Text("\(names[i])").tag(i)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}





