//
//  QuizView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct QuizView: View {
    
    @State private var isQuizComplete = false

    let questions = [
        "What is the capital of France?",
        "What is 2 + 2?",
        "What is the color of the sky?",
        "Who wrote 'To Kill a Mockingbird'?"
    ]

    // State to track the current question index
    @State private var questionIndex = 0

    // State to trigger the fade animation
    @State private var fadeAnimation = true

    var isEvenQuestion: Bool {
        questionIndex.isMultiple(of: 2)
    }

    var body: some View {
        VStack(spacing: .medium) {
            questionlabel
            HStack {
                backButton
                nextButton
            }
        }
        .padding(.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isQuizComplete) {
            QuizCompleteView()
        }
    }
}

private extension QuizView {
   
    var questionlabel: some View {
        Text(questions[questionIndex])
            .rotationEffect(isEvenQuestion ? .degrees(0) : .degrees(-180))
            .font(.bodyFont)
            .opacity(fadeAnimation ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: fadeAnimation)
    }
    
    var backButton: some View {
        Button(action: didTapBackButton) {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color.white.opacity(0.75))
                    .shadow(radius: 5)
                IconImage(icon: .back, size: 16, weight: .heavy)
                    .foregroundStyle(Color.black)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(questionIndex == 0)
        .opacity(questionIndex == 0 ? 0 : 1)
    }
    
    var nextButton: some View {
        Button(action: didTapNextButton) {
            Text("NEXT")
                .font(.headline)
                .foregroundColor(.black)
                .padding([.leading, .trailing], .medium)
                .frame(height: 48)
                .background(Color.white.opacity(0.75))
                
        }
        .buttonStyle(PlainButtonStyle())
        .clipShape(Capsule())
        .shadow(radius: 5)
        .disabled(questionIndex == questions.count)
    }
}

private extension QuizView {
    
    func didTapBackButton() {

        guard questionIndex > 0 else {
            return
        }
        
        withAnimation {
            fadeAnimation = false  // Start fading out
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // Wait for fade out to complete
            questionIndex -= 1

            withAnimation {
                fadeAnimation = true  // Start fading in
            }
        }
    }
    
    func didTapNextButton() {

        guard questionIndex < questions.count - 1 else {
            isQuizComplete.toggle()
            return
        }

        withAnimation {
            fadeAnimation = false  // Start fading out
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Wait for fade out to complete
            questionIndex += 1

            withAnimation {
                fadeAnimation = true  // Start fading in
            }
        }
    }
}

#Preview {
    QuizView()
}
