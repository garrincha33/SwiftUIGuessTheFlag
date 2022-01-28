//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Richard Price on 26/01/2022.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                       // flag was tapped
                    } label: {
                        Image(countries[number])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200.0,height:200)

                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
