//
//  AboutView.swift
//  ThirtySixQuestions
//
//  Created by Andrew Davis on 10/08/2024.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.dismiss) var dismiss

    let aboutText = """
    On the 9th of January 2015, Mandy Len Catron published an essay in The New York Times describing her experience replicating a study that claims to accelerate intimacy between two people.

    Psychologist Dr Arthur Aron, author of the study, devised a series of 36 specific questions intended to be asked by each person to their partner. The questions begin rather tamely, and progressively get deeper and more personal. It can be difficult to open up to a person, especially a stranger, this experience forces both parties to open up and become vulnerable with one another.

    The original study had a very interesting outcome. A man and woman, both complete strangers at the time entered a room separately. Both took part asking and answering a series of questions, ending the experiment by staring silently into each other's eyes for four minutes. The outcome? Six months later, the two participants were married!

    To play the quiz with your partner, you really don't need anything more than this app. Sit opposite your partner with your device between you. Take turns reading one question aloud to your partner, then both of you answer. Simple, but terrifying!

    There is no time limit, be honest and be truthful. The final recommended task is to stare silently into your partners eyes for four minutes. Nervous yet?
    """

    var body: some View {
        VStack {
            navigationBar
            scrollingText
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

// MARK: - Views

private extension AboutView {
    
    var navigationBar: some View {
        ZStack {
            Text("About")
                .foregroundStyle(.black)
                .font(.titleFont)
                .frame(height: 48)
            HStack {
                CloseButton {
                    dismiss()
                }
                .padding(.leading, .medium)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var scrollingText: some View {
        ScrollView {
            Text(aboutText)
                .foregroundStyle(.black)
                .font(.bodyFont)
                .padding([.top, .bottom], .large)
                .padding([.leading, .trailing], .xLarge)
        }
    }
}

#Preview {
    AboutView()
}
