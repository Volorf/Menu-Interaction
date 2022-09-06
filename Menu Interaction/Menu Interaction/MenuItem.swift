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
    @Binding var showItems: Bool
    @Binding var hasSomethingBeenChanged: Bool
    
    @State private var scaleAnime: Double = 0.5
    
    private let size: Double = 128
    private let iconSize: Double = 48
    private let animDur = 0.2
    
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
        .scaleEffect(showItems ? 1 : 0.5)
        .opacity(showItems ? 1 : 0)
        .mask(
            Rectangle()
                .frame(width: size, height: size)
        )
        .animation(.easeInOut(duration: currentThumbstickState == buttonThumbstickState && !showItems && hasSomethingBeenChanged ? 0 : animDur), value: showItems ? 1 : 0.5)
        
        
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            Color(.gray)
            MenuItem(labelName: "Test", buttonThumbstickState: .North, currentThumbstickState: .constant(.North), hasThumbstickBeenReleased: .constant(false), showItems: .constant(true), hasSomethingBeenChanged: .constant(false))
        }
        
    }
}
