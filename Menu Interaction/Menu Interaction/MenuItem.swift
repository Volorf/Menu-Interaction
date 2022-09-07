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
    private let animDur: Double = 0.3
    
    var body: some View
    {
        ZStack()
        {
            // TODO: Invert the statement
            if(currentThumbstickState == buttonThumbstickState
               && hasThumbstickBeenReleased && hasSomethingBeenChanged)
            {
                
            }
            else
            {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                    .scaledToFit()
                Text(labelName)
                    .foregroundColor(.white)
                    .font(.custom("AeonikMonoTRIAL-Bold", size: 40))
                    .opacity(currentThumbstickState != buttonThumbstickState ? 0.3 : 1)
                
                    .frame(width: size, height: size)
                    .animation(.easeOut(duration: animDur), value: currentThumbstickState != buttonThumbstickState ? 0.3 : 1)
            }
            
        }
        .frame(width: size, height: size)
        .scaleEffect(showItems ? 1 : 0.5)
        .opacity(showItems ? 1 : 0)
        .mask(
            Rectangle()
                .frame(width: size, height: size)
        )
        .animation(.easeOut(duration: currentThumbstickState == buttonThumbstickState && !showItems && hasSomethingBeenChanged ? 0 : animDur), value: showItems ? 1 : 0.5)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            Color(.gray)
            MenuItem(labelName: "", buttonThumbstickState: .North, currentThumbstickState: .constant(.North), hasThumbstickBeenReleased: .constant(false), showItems: .constant(true), hasSomethingBeenChanged: .constant(false))
        }
        
    }
}
