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
            
            VStack(alignment: .center, spacing: .medium) {
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
        VStack(spacing: .medium) {
            ZStack {
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 160, height: 160)
                Circle()
                    .stroke(Color.accent1, lineWidth: 4)
                    .frame(width: 140, height: 140)
                Text("36")
                    .font(.custom("HiraMinProN-W6", size: 72))
                    .foregroundStyle(
                        .accent1
                    )
            }
            Text("Questions\nTo Fall In Love\nWith Anyone")
                .font(.system(size: 36, weight: .heavy, design: .default))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .shadow(radius: 10)
        }
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
        TextButton(title: "START QUIZ", icon: Image(systemName: "person.2.fill"), fullWidth: true) {
            hapticsManager.generateSoftHaptic()
            isQuizPresented.toggle()
        }
    }
    
    var aboutButton: some View {
        TextButton(
            title: "ABOUT",
            icon: Image(systemName: "heart.text.square.fill"),
            fullWidth: true
        ) {
            hapticsManager.generateSoftHaptic()
            isAboutPresented.toggle()
        }
    }
    
    var tellAFriendButton: some View {
        TextButton(
            title: "TELL A FRIEND",
            icon: Image(systemName: "square.and.arrow.up"),
            fullWidth: true
        ) {
            hapticsManager.generateSoftHaptic()
            isShareSheetPresented.toggle()
        }
    }
    
    var shareSheet: some View {
        ShareSheet(items: [
            "I just took the 36 questions quiz with my partner. You should try it too!", URL(string: "https://apps.apple.com/gb/app/36-questions-to-fall-in-love-with-anyone/id961960090")!])
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
