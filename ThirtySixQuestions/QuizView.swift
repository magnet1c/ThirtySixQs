//
//  QuizView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationBarHidden(true)            // Hide the navigation bar
        .navigationBarBackButtonHidden(true)  // Hide the back button
    }
}

#Preview {
    QuizView()
}
