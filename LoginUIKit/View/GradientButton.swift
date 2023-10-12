//
//  GradientButton.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 11/10/2023.
//

import SwiftUI

struct GradientButton: View {
    
    var title: String
    var icon: String
    var onClick: () -> ()
    
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom), in: .capsule)
        })
    }
}
