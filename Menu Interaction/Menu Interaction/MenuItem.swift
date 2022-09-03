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
        MenuItem(labelName: "Test", buttonThumbstickState: .North, currentThumbstickState: .constant(.North), counter: .constant(0))
    }
}
