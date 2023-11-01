//
//  SignUp.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 31/10/2023.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup: Bool
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Registrarse")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Por favor regístrate para continuar")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Se agrega CustomTextFields
                CustomTextFields(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTextFields(sfIcon: "person", hint: "Nombre completo", value: $fullName)
                    .padding(.top, 5)
                
                CustomTextFields(sfIcon: "lock", hint: "Contraseña", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                GradientButton(title: "Continuar", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
                
            } //: VStack
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("¿Ya estás registrado?")
                
                Button("Ingresar") {
                    showSignup = false
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
        
    }
}

#Preview {
    ContentView()
}
