//
//  ViewExtensions.swift
//  LoginUIKit
//
//  Created by Gustavo Dong on 11/10/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center ) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    // Disabling with opacity
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
