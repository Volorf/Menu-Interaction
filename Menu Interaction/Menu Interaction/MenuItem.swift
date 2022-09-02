//
//  MenuItem.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 02/09/2022.
//

import SwiftUI

struct MenuItem: View {
    
    @Binding var isActive: Bool
    let labelName: String
    
    private let size: Double = 50
    
    var body: some View {
        ZStack()
        {
            Rectangle()
                .fill(.red)
                .scaledToFit()
            Rectangle()
                .fill(.indigo)
                .frame(width: 20, height: 20)
            Text(labelName)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .offset(x: 0, y: isActive ? 10 : size - 30)
        }
        .frame(width: size, height: size)
        .mask(
            Rectangle()
                .frame(width: size, height: size)
        )
        
        
        
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(isActive: .constant(false), labelName: "Test")
    }
}
