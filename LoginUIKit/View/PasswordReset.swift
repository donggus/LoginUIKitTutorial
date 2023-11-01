//
//  PasswordReset.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 01/11/2023.
//

import SwiftUI

struct PasswordReset: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    /// Propiedades de ENTORNO
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .offset(y: 10)
                    .hSpacing(.trailing)
            })
            .padding(.top, 10)
            
            Text("Reiniciar Contraseña")
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
                CustomTextFields(sfIcon: "lock", hint: "Contraseña", value: $password)
                
                CustomTextFields(sfIcon: "lock", hint: "Confirmar Contraseña", value: $confirmPassword)
                
                GradientButton(title: "Enviar Link", icon: "arrow.right") {
                    // Reset password
                    
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
                
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
