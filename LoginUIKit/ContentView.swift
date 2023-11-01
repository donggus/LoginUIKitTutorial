//
//  ContentView.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignup: Bool = false
    
    var body: some View {
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                }
        } //: NavigationStack
        .overlay {
            if #available(iOS 17, *) {
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
            } else {
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
            }
        }
    }
    
    /// Moviendo Fondo difuminado
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            /// que se mueva cuando la pagina se loadea
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
