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
                //Tilte for explaination of the game
                Text("Select if the number is \"Prime\" or \"Not Prime\"")
                    .font(.title)
                Spacer()
                
                //Number displayed on the screen
                Text("\(randomNumber)")
                    .font(.system(size: 60))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                //Validation icon displayed on the screen when the answer selected or time passed
                
                if let validateIcon = validateIcon {
                    Text(validateIcon)
                        .font(.system(size: 50))
                }
                Spacer()
                
                //Button Prime or Not Prime
                
                HStack(spacing:30){
                    //Prime button with the handleAnser function:
                    Button(action: {handleAnswers(isPrime: true)}) {
                        Text("Prime")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    //Not prime button with handleAnswer function:
                    Button(action: {handleAnswers(isPrime: false)}) {
                        Text("Not Prime")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
    
    //Support nextNumber() to generate next Random number
    func nextNumber() {
        //Set up delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            validateIcon = nil
            randomNumber = Int.random(in: 1...100)
            timeRemaining = 5
        }
}

#Preview {
    ContentView()
}
