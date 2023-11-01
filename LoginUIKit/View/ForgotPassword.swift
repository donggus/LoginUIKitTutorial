//
//  ForgotPassword.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 31/10/2023.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    @State private var emailID: String = ""
    /// Propiedades de ENTORNO
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Olvidé mi contraseña")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Por favor ingresa tu Email ID para enviarte el link de recuperación.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Se agrega CustomTextFields
                CustomTextFields(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                GradientButton(title: "Enviar Link", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
                
            } //: VStack
            .padding(.top, 20)
            
        }) // :VStack
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
        
    }
}

#Preview {
    ContentView()
}
