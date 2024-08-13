//
//  HomeView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct HomeView: View {

    /// State to present Quiz view
    @State private var isQuizPresented = false

    /// State to present About view
    @State private var isAboutPresented = false

    /// State to present share sheet
    @State private var isShareSheetPresented = false

    var body: some View {
        VStack(alignment: .leading) {
            logoView
            Spacer()
            quizButton
            aboutButton
                .frame(maxWidth: .infinity)
            tellAFriendButton
                .frame(maxWidth: .infinity)
        }
        .padding(.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .fullScreenCover(isPresented: $isQuizPresented) {
            NavigationView {
                QuizInstructionsView()
            }
        }
        .fullScreenCover(isPresented: $isAboutPresented) {
            AboutView()
        }
        .sheet(isPresented: $isShareSheetPresented) {
            shareSheet
        }
    }
}

// MARK: - Views

private extension HomeView {
    
    var logoView: some View {
        Image("36-questions-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 240)
    }

    var quizButton: some View {
        Button(action: {
            isQuizPresented.toggle()
        }) {
            Text("START QUIZ")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.75))
        }
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
    
    var aboutButton: some View {
        Button(action: {
            isAboutPresented.toggle()
        }) {
            Text("ABOUT")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.75))
        }
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
    
    var tellAFriendButton: some View {
//        Button("TELL A FRIEND") {
//            isShareSheetPresented.toggle()
//        }
        Button(action: {
            isShareSheetPresented.toggle()
        }) {
            Text("TELL A FRIEND")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.75))
        }
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
    
    var shareSheet: some View {
        ShareSheet(items: ["Here is some text to share!", URL(string: "https://www.example.com")!])
    }
}

#Preview {
    HomeView()
}

// MARK - Share sheet

import UIKit

struct ShareSheet: UIViewControllerRepresentable {

    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No update needed
    }
}
