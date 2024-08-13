//
//  QuizInstructionsView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 13/08/2024.
//

import SwiftUI

struct QuizInstructionsView: View {
    
    var body: some View {
        VStack {
            Text("Instructions go here")
                .background(Color.orange)
            
            NavigationLink(destination: QuizView()) {
                Text("START")
                //Button("START") {
                //    isShareSheetPresented.toggle()
                //}
            }
        }
    }
}

#Preview {
    QuizInstructionsView()
}
