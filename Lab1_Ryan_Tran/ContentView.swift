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
        VStack {
            ZStack() {
                Color(.systemGray)
                    .ignoresSafeArea()
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
