//
//  Login.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 11/10/2023.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    @State private var showResetView: Bool = false
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            
            Text("Ingreso")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Por favor ingresa para continuar")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Se agrega CustomTextFields
                CustomTextFields(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTextFields(sfIcon: "lock", hint: "Contraseña", isPassword: true, value: $password)
                    .padding(.top, 5)

                Button("¿Olvidaste la contraseña?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.orange)
                .hSpacing(.trailing)
                
                GradientButton(title: "Ingresar", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                
            } //: VStack
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("¿No estás registrado?")
                
                Button("Registrarse") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.orange)
            }
            .font(.callout)
            .hSpacing()
            
        }) // :VStack
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        /// Preguntar po email para enviar link de reinicio
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *) {
                /// Debido a que quiero un Custom Sheet Radius
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        })
        /// Reiniciarndo nueva contraseña
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                /// Debido a que quiero un Custom Sheet Radius
                PasswordReset()
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                PasswordReset()
                    .presentationDetents([.height(300)])
            }
        })
        /// OTP Prompt
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *) {
                /// Debido a que quiero un Custom Sheet Radius
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(300)])
            }
        })
    }
}

#Preview {
    ContentView()
}
