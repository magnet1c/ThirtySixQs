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
        VStack {
            logoView
            quizButton
            aboutButton
            tellAFriendButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .fullScreenCover(isPresented: $isQuizPresented) {
            QuizView()
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
        Text("36")
    }

    var quizButton: some View {
        Button("START THE QUIZ") {
            isQuizPresented.toggle()
        }
    }
    
    var aboutButton: some View {
        Button("ABOUT") {
            isAboutPresented.toggle()
        }
    }
    
    var tellAFriendButton: some View {
        Button("TELL A FRIEND") {
            isShareSheetPresented.toggle()
        }
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
