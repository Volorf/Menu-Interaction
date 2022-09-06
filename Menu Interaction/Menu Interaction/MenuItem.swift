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
    @Binding var hasThumbstickBeenReleased: Bool
    
    private let size: Double = 128
    private let iconSize: Double = 48
    
    var body: some View {
        ZStack()
        {
            
            if(currentThumbstickState == buttonThumbstickState && hasThumbstickBeenReleased)
            {
                
            }
            else
            {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                    .scaledToFit()
                Text(labelName)
                    .foregroundColor(currentThumbstickState != buttonThumbstickState ? .gray : .white)
                    .font(.custom("Helvetica", size: 40))
                    .frame(width: size, height: size)
            }
            
                
            
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
        ZStack
        {
            Color(.gray)
            MenuItem(labelName: "Test", buttonThumbstickState: .North, currentThumbstickState: .constant(.North), hasThumbstickBeenReleased: .constant(false))
        }
        
    }
}
