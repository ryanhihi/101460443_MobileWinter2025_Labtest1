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
        
        //Function to handle Right / Wrong anser
        func handleAnswers (isPrime: Bool) {
            
            if checkPrime(randomNumber) == isPrime {
                validateIcon = "✅"
                correctAnswers += 1
            } else {
                validateIcon = "❌"
                wrongAnswers += 1
            }
            
            attempts += 1
            if attempts == 10 {
                showAlert = true
            } else {
                nextNumber()
            }
            
            
        }
        
        //Function to check if the random number is Prime
        func checkPrime(_ number: Int) -> Bool {
            //1 is not prime number
            guard number > 1 else { return false}
            
            //if the number greater equal to 2
            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }
            return true
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
    
    //Timer logic support
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else{//If fail to answer wrong:
                validateIcon = "❌"
                wrongAnswers += 1
                attempts += 1
                
                if attempts == 10 {
                    showAlert = true
                    timer?.invalidate()
                } else {
                    nextNumber()
                }
            }
            
        }
    }
    
    //Function to reset game after 10 attemps
    
    func resetGame() {
        correctAnswers = 0
        wrongAnswers = 0
        attempts = 0
        timeRemaining = 5
        nextNumber()
        startTimer()
    }
        
    
}
    

#Preview {
    ContentView()
}
