//
//  Font.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

extension Font {
    static let titleFont: Font = .custom("Georgia-Bold", size: 28)
    static let bodyFont: Font = .custom("Georgia", size: 19)
    static let questionNumberFont: Font = .system(size: 40, weight: .heavy, design: .rounded)
    static let questionFont: Font = .custom("Georgia-Bold", size: 32)
    static let buttonFont: Font = .system(size: 17, weight: .heavy, design: .rounded)
}
