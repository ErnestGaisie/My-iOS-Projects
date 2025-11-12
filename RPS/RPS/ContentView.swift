//
//  ContentView.swift
//  RPS
//
//  Created by Ernest Gaisie on 12/11/2025.
//

import SwiftUI

struct ContentView: View {
    var types = ["Rock", "Paper", "Scissors"]
    @State var selectedType = Int.random(in: 0..<3)
    
    var prompt = ["Win", "Lose"]
    @State var selectedPrompt = Int.random(in: 0..<2)
    
    @State var round = 0
    @State var score = 0
    @State var showModal = false
    @State var gameCompleted = false
    
    var body: some View {
        VStack () {
            
            //Title
            Text(prompt[selectedPrompt])
            
            Spacer()
                        
            // Selected Type
            Text(types[selectedType])
            
            Spacer()
            VStack(spacing:20) {
                ForEach(types, id: \.self) { type in
                    Button {
                        typeSelected(type)
                    } label: {
                        Text(type)
                    }
                }
            }
            
            Spacer()
            Spacer()
            
        }
        .padding()
        .alert("Your Score is: \(score)", isPresented: $showModal) {
            Button("Okay") {
                next()
            }
        }
        .alert("Game Completed Tap Okay to restart", isPresented: $gameCompleted) {
            Button("Okay") {
               restart()
               
            }
        }
    }
    
    func typeSelected(_ type: String) {
        
        var correctAnswer: Bool = false
        
        if prompt[selectedPrompt] == "Win" {
            if types[selectedType] == "Rock" {
                if type == "Paper" {
                    correctAnswer = true
                }
            } else if types[selectedType] == "Paper" {
                if type == "Scissors" {
                    correctAnswer = true
                }
            } else {
                if type == "Rock" {
                    correctAnswer = true
                }
            }
        } else {
            if types[selectedType] == "Rock" {
                if type == "Scissors" {
                    correctAnswer = true
                }
            } else if types[selectedType] == "Paper" {
                if type == "Rock" {
                    correctAnswer = true
                }
            } else {
                if type == "Paper" {
                    correctAnswer = true
                }
            }
        }
        
        if correctAnswer == true {
            score += 1
        } else {
            score -= 1
        }
        
        round += 1
        
        if (round == 3) {
            gameCompleted = true
        }else {
            showModal = true
        }
        
    }
    
    func next() {
        selectedType = Int.random(in: 0..<3)
        selectedPrompt = Int.random(in: 0..<2)
        showModal = false
    }
    
    func restart() {
        selectedType = Int.random(in: 0..<3)
        selectedPrompt = Int.random(in: 0..<2)
        gameCompleted = false
        round = 0
    }
}

#Preview {
    ContentView()
}
