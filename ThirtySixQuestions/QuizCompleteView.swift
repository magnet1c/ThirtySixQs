//
//  QuizCompleteView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 14/08/2024.
//

import SwiftUI



struct QuizCompleteView: View {

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let timerTotalDuration: Int = 30 // 240 seconds = 4 minutes
    private let hapticsManager = HapticsManager()

    @State private var timerIsActive = false
    @State private var counter: Int = 0

    var body: some View {
        VStack(spacing: .medium) {
            if timerIsActive {
                // Countdown timer
                ZStack{
                    ProgressTrack()
                    ProgressBar(counter: counter, countTo: timerTotalDuration)
                    CountdownLabel(counter: counter, countTo: timerTotalDuration)
                }
            } else {
                // Start timer content
                titleLabel
                instructionsLabel
                Spacer()
                    .frame(height: .small)
                startTimeButton
                skipButton
            }
        }
        .onReceive(timer) { _ in
            if timerIsActive && counter < timerTotalDuration {
                self.counter += 1
            } 
            
            // Finished
            if timerIsActive && counter >= timerTotalDuration {
                hapticsManager.generateHeavyHaptic()
                timerIsActive = false
                dismiss()
            }
        }
        .padding(.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Views

private extension QuizCompleteView {
    
    var titleLabel: some View {
        Text("Well Done")
            .foregroundStyle(.black)
            .font(.titleFont)
    }
    
    var instructionsLabel: some View {
        Text("You've reached the end of the questions. The final test is to stare into your partners eyes for four minutes.\n\nIt's important to finish with this step. Some people have described this step as thrilling and terrifying. Good luck...")
            .foregroundStyle(.black)
            .font(.bodyFont)
            .multilineTextAlignment(.center)
    }

    var startTimeButton: some View {
        Button(action: didTapStartTimer) {
            Text("START TIMER")
                .font(.buttonFont)
                .foregroundColor(.black)
                .padding([.leading, .trailing], .large)
                .padding([.top, .bottom], .medium)
                .frame(height: 48)
                .background(Color.white.opacity(0.75))
                
        }
        .buttonStyle(PlainButtonStyle())
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
    
    var skipButton: some View {
        Button(action: didTapSkip) {
            Text("SKIP")
                .font(.buttonFont)
                .foregroundColor(.white)
                .padding([.leading, .trailing], .large)
                .frame(height: 48)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Actions

private extension QuizCompleteView {

    func didTapStartTimer() {
        hapticsManager.generateSoftHaptic()
        timerIsActive = true
    }
    
    func didTapSkip() {
        hapticsManager.generateSoftHaptic()
        dismiss()
    }
    
    func dismiss() {
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

#Preview {
    QuizCompleteView()
}

struct CountdownLabel: View {

    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.questionNumberFont)
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct ProgressTrack: View {

    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 240, height: 240)
            .overlay(
                Circle().stroke(Color.white.opacity(0.6), lineWidth: .medium)
        )
    }
}

struct ProgressBar: View {

    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 240, height: 240)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: .medium,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(Color.white)
                    .animation(.easeInOut(duration: 0.2))
                    .rotationEffect(.degrees(-90))
            )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}
