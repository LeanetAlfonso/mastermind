//
//  PlayButton.swift
//  Mastermind
//
//  Created by Leanet Alfonso Azcona on 3/3/22.
//

import SwiftUI

struct PlayButton: View {
    
    @State private var wave = true
    
    var body: some View {
        Image(systemName: "play")
            .resizable()
            .frame(width: 40, height: 40)
            .background(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.accentColor, lineWidth: 2)
                            .frame(width: 100, height: 100))
            .padding()
            .opacity(wave ? 1 : 0.3)
            .onAppear() {
                wave.toggle()
                withAnimation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)
                        .speed(1.5)) {
                            wave.toggle()
                        }
            }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton()
    }
}
