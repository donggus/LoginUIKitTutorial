//
//  OTPView.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 01/11/2023.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
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
            .padding(.top, 15)
            
            Text("Ingresa clave OTP")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Te enviamos a tu Email una clave de 6 dígitos.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom OTP TextField
                OTPTextField(otpText: $otpText)
                
                
                GradientButton(title: "Enviar OTP", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.isEmpty)
                
            } //: VStack
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
        }) // :VStack
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
        
    }
}

#Preview {
    ContentView()
}
