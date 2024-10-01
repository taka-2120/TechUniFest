//
//  TerminalView.swift
//  TechUniFest
//
//  Created by Yu Takahashi on 10/2/24.
//

import SwiftUI

struct TerminalView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var terminalText = "This is a terminal like view."
    
    var body: some View {
        ScrollView {
            Text(terminalText)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size: 14, design: .monospaced))
                .padding()
        }
        .scrollIndicators(.hidden)
        .statusBarHidden()
        .toolbar(.hidden, for: .navigationBar)
        .background {
            Color.black
                .ignoresSafeArea()
        }
        .onTapGesture {
            dismiss()
        }
    }
}
