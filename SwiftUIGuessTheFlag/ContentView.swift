//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Richard Price on 26/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

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
                       FlagTapped(number)
                    } label: {
                        Image(countries[number])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200.0,height:200)

                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: AskQuestion)
        } message: {
            Text("your score is \(score)")
        }
    }
    
    func FlagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func AskQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
