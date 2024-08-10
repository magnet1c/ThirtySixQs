//
//  AboutView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("About")
            Text("Some about text here over multiple lines lets see how far it goes")
            Button("Close") {
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

#Preview {
    AboutView()
}
