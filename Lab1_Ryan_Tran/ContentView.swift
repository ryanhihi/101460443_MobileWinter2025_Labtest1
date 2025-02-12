//
//  ContentView.swift
//  Lab1_Ryan_Tran
//
//  Created by Ryan Tran on 2025-02-12.
//

import SwiftUI


struct ContentView: View {
    
    //Declare variables
    @State private var randomNumber = Int.random(in: 1...100)
    @State private var correctAnswers = 0
    @State private var wrongAnswers = 0
    @State private var attempts = 0
    @State private var timer: Timer? = nil
    @State private var showAlert = false
    @State private var validateIcon: String? = nil
    @State private var timeRemaining = 5
    var body: some View {
        ZStack() {
            Color(.systemGray)
                .ignoresSafeArea()
            
            VStack (spacing: 20){
                
                Text("Select if the number is \"Prime\" or \"Not Prime\"")
                    .font(.title)
                Spacer()
                
                Text("\(randomNumber)")
                    .font(.system(size: 60))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
