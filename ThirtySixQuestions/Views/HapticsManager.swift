//
//  HapticsManager.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 17/08/2024.
//

import UIKit
import SwiftUI

final class HapticsManager: NSObject {

    // MARK: - Properties

    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    
    // MARK: - Init
    
    override init() {
        super.init()
        // It can take a small amount of time for the system to prepare haptic feedback, Apple recommends calling prepare() before triggering the haptic effect.
        impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackGenerator?.prepare()
    }
    
    // MARK: - Impact feedback
    
    func generateSoftHaptic() {
        generateImpactFeedback(.soft)
    }
    
    func generateHeavyHaptic() {
        generateImpactFeedback(.soft)
    }
    
    private func generateImpactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {

        impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
        
        executeOnMainThread {
            self.impactFeedbackGenerator?.impactOccurred()
        }
    }
    
    private func executeOnMainThread(_ block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }
}
