//
//  QuizView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct QuizView: View {
    
    @State private var isQuizComplete = false

//    let questions = [
//        "What is the capital of France?",
//        "What is 2 + 2?",
//        "What is the color of the sky?",
//        "Who wrote 'To Kill a Mockingbird'?"
//    ]
    
    let questions = [
        "Given the choice of anyone in the world, whom would you want as a dinner guest?",
        "Would you like to be famous? In what way?",
        "Before making a telephone call, do you ever rehearse what you are going to say? Why?",
        "What would constitute a “perfect” day for you?",
        "When did you last sing to yourself? To someone else?",
        "If you were able to live to the age of 90 and retain either the mind or body of a 30-year-old for the last 60 years of your life, which would you want?",
        "Do you have a secret hunch about how you will die?",
        "Name three things you and your partner appear to have in common.",
        "For what in your life do you feel most grateful?",
        "If you could change anything about the way you were raised, what would it be?",
        "Take four minutes and tell your partner your life story in as much detail as possible.",
        "If you could wake up tomorrow having gained any one quality or ability, what would it be?",
        "If a crystal ball could tell you the truth about yourself, your life, the future or anything else, what would you want to know?",
        "Is there something that you’ve dreamed of doing for a long time? Why haven’t you done it?",
        "What is the greatest accomplishment of your life?",
        "What do you value most in a friendship?",
        "What is your most treasured memory?",
        "What is your most terrible memory?",
        "If you knew that in one year you would die suddenly, would you change anything about the way you are now living? Why?",
        "What does friendship mean to you?",
        "What roles do love and affection play in your life?",
        "Alternate sharing something you consider a positive characteristic of your partner. Share a total of five items.",
        "How close and warm is your family? Do you feel your childhood was happier than most other people’s?",
        "How do you feel about your relationship with your mother?",
        "Make three true “we” statements each. For instance, “We are both in this room feeling ... ”",
        "Complete this sentence: “I wish I had someone with whom I could share ... ”",
        "If you were going to become a close friend with your partner, please share what would be important for him or her to know.",
        "Tell your partner what you like about them; be very honest this time, saying things that you might not say to someone you’ve just met.",
        "Share with your partner an embarrassing moment in your life.",
        "When did you last cry in front of another person? By yourself?",
        "Tell your partner something that you like about them already.",
        "What, if anything, is too serious to be joked about?",
        "If you were to die this evening with no opportunity to communicate with anyone, what would you most regret not having told someone? Why haven’t you told them yet?",
        "Your house, containing everything you own, catches fire. After saving your loved ones and pets, you have time to safely make a final dash to save any one item. What would it be? Why?",
        "Of all the people in your family, whose death would you find most disturbing? Why?",
        "Share a personal problem and ask your partner’s advice on how he or she might handle it. Also, ask your partner to reflect back to you how you seem to be feeling about the problem you have chosen."
    ]

    // State to track the current question index
    @State private var questionIndex = 0

    // State to trigger the fade animation
    @State private var fadeAnimation = true

    var isEvenQuestion: Bool {
        questionIndex.isMultiple(of: 2)
    }

    var body: some View {
        ZStack {
            
            // Question number + nav buttons
            VStack {
                HStack {
                    questionNumberlabel
                    Spacer()
                }
                Spacer()
                HStack(spacing: .medium) {
                    if questionIndex != 0 {
                        backButton
                    }
                    nextButton
                }
            }
            
            // Question
            if questionIndex >= 0 && questionIndex < questions.count {
                questionlabel
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

    var questionNumberlabel: some View {
        Text("\(questionIndex+1)")
            .foregroundStyle(.black.opacity(0.25))
            .font(.titleFont)
            .opacity(fadeAnimation ? 1 : 0)
            //.animation(.easeInOut(duration: 0.5), value: fadeAnimation)
    }

    var questionlabel: some View {
        Text(questions[questionIndex])
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .font(.titleFont)
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
        .disabled(questionIndex <= 0)
        .opacity(questionIndex <= 0 ? 0 : 1)
    }
    
    var nextButton: some View {
        Button(action: didTapNextButton) {
            Text("NEXT")
                .font(.headline)
                .foregroundColor(.black)
                .padding([.leading, .trailing], .large)
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
