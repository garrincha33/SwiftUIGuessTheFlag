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
            LinearGradient(gradient: Gradient(colors: [.mint, .orange]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.bold))
                            
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                           FlagTapped(number)
                        } label: {
                            Image(countries[number])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150,height:150)
                                .shadow(radius: 10)

                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.system(size: 40))
                    .foregroundStyle(.secondary)
            }.padding()
            
            
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
