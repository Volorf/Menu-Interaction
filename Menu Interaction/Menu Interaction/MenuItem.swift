//
//  MenuItem.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 02/09/2022.
//

import SwiftUI

struct MenuItem: View {
    
    let labelName: String
    let buttonThumbstickState: Thumbstick
    @Binding var currentThumbstickState: Thumbstick
    @Binding var counter: Int
    
    private let size: Double = 128
    private let iconSize: Double = 48
    
    var body: some View {
        ZStack()
        {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .scaledToFit()
            Rectangle()
                .fill(.indigo)
                .frame(width: iconSize, height: iconSize)
            Text(labelName)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .offset(x: 0, y: currentThumbstickState == buttonThumbstickState ? 10 : size - 30)
        }
        .frame(width: size, height: size)
        .mask(
            Rectangle()
                .frame(width: size, height: size)
        )
        .onTapGesture()
        {
            counter += 1;
        }
        
        
        
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            Color(.gray)
            MenuItem(labelName: "Test", buttonThumbstickState: .North, currentThumbstickState: .constant(.North), counter: .constant(0))
        }
        
    }
}
