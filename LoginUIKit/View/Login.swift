//
//  Login.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 11/10/2023.
//

import SwiftUI

struct Login: View {
    
    @State private var emailID: String = ""
    @State private var password: String = ""
    
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
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.orange)
                .hSpacing(.trailing)
                
                GradientButton(title: "Ingresar", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                
            } //: VStack
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("¿No estás registrado?")
                
                Button("Registrarse") {
                    
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
