//
//  HomeView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct HomeView: View {

    /// State to present Quiz view
    @State private var isQuizPresented = false

    /// State to present About view
    @State private var isAboutPresented = false

    /// State to present share sheet
    @State private var isShareSheetPresented = false

    private let hapticsManager = HapticsManager()

    @State private var accent1Angle: Double = 0
    @State private var accent2Angle: Double = 0

    var body: some View {
        ZStack {

            blurryBackgroundView
            
            VStack(alignment: .leading, spacing: .medium) {
                logoView
                Spacer()
                quizButton
                aboutButton
                    .frame(maxWidth: .infinity)
                tellAFriendButton
                    .frame(maxWidth: .infinity)
            }
            .padding(.xLarge)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
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

    var blurryBackgroundView: some View {
        ZStack {
            Circle()
                .fill(Color.accent1)
                .frame(width: 370, height: 340)
                .opacity(0.8)
                .offset(x: -110)
                .offset(y: 20)
                .rotationEffect(.degrees(accent1Angle))
                .onAppear {
                    withAnimation(Animation.linear(duration: 30).repeatForever(autoreverses: false)) {
                        accent1Angle = 360
                    }
                }
                .blur(radius: 90)
            
            Circle()
                .fill(Color.accent2)
                .frame(width: 420, height: 400)
                .opacity(0.8)
                .offset(x: 150)
                .offset(y: -80)
                .rotationEffect(.degrees(accent2Angle))
                .onAppear {
                    withAnimation(Animation.linear(duration: 32).repeatForever(autoreverses: false)) {
                        accent2Angle = 360
                    }
                }
                .blur(radius: 90)
            //VisualEffectView(effect: UIBlurEffect(style: .light))
                //.edgesIgnoringSafeArea(.all)
        }
    }

    var quizButton: some View {
        TextButton(title: "START QUIZ", fullWidth: true) {
            hapticsManager.generateSoftHaptic()
            isQuizPresented.toggle()
        }
    }
    
    var aboutButton: some View {
        TextButton(title: "ABOUT", fullWidth: true) {
            hapticsManager.generateSoftHaptic()
            isAboutPresented.toggle()
        }
    }
    
    var tellAFriendButton: some View {
        TextButton(title: "TELL A FRIEND", fullWidth: true) {
            hapticsManager.generateSoftHaptic()
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
