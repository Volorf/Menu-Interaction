//
//  MenuButton.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 03/09/2022.
//

import SwiftUI

struct MenuButton: View {
    
    @State private var offset = CGSize.zero
    @Binding var currentThumbstickState: Thumbstick
    let triggerLimit: Double = 10
    let changeStateTriggerLimit: CGFloat = 64 + 128
    @State private var currentMovingState: MovingState = .None
    @State private var limitedOffset = CGSize.zero
    
    @State private var sizeWidthKoef: Double = 0.0
    @State private var sizeHeightKoef: Double = 0.0
    
    private let fullSize: Double = 128 + 64
    private let buttonSize: Double = 128
    
    @State private var labelText: String = "D"
    @State private var showLabel: Bool = true;
    
    var body: some View
    {
        ZStack()
        {
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                .frame(width: buttonSize + sizeWidthKoef, height: buttonSize + sizeHeightKoef)
                .offset(x: limitedOffset.width / 2, y: limitedOffset.height / 2)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                .frame(width: buttonSize, height: buttonSize)
                .offset(x: limitedOffset.width, y: limitedOffset.height)
                .gesture(
                    DragGesture()
                        .onChanged
                        {
                            gesture in offset = gesture.translation
                            
                            showLabel = false
                            
                            if(currentMovingState == .Horizontal)
                            {
                                limitedOffset.width = offset.width
                                
                                sizeWidthKoef = abs(limitedOffset.width)
                                sizeHeightKoef = 0
                                
                                if (offset.width >= changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .East
                                    limitedOffset.width = changeStateTriggerLimit
                                    sizeWidthKoef = fullSize
                                    
                                    labelText = "D"
                                    
                                    return
                                }
                                
                                if (offset.width <= -changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .West
                                    limitedOffset.width = -changeStateTriggerLimit
                                    sizeWidthKoef = fullSize
                                    
                                    labelText = "N"
                                    return
                                }
                                
                                
                            }
                            
                            if(currentMovingState == .Vertical)
                            {
                                limitedOffset.height = offset.height
                                
                                sizeHeightKoef = abs(limitedOffset.height)
                                sizeWidthKoef = 0
                                
                                if (offset.height >= changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .South
                                    limitedOffset.height = changeStateTriggerLimit
                                    sizeHeightKoef = fullSize
                                    
                                    labelText = "R"
                                    return
                                }
                                
                                if (offset.height <= -changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .North
                                    limitedOffset.height = -changeStateTriggerLimit
                                    sizeHeightKoef = fullSize
                                    
                                    labelText = "P"
                                    return
                                }
                            }
                            
                            
                            if (currentMovingState != .None) { return }
                            
                            
                            if (gesture.translation.width >= triggerLimit || gesture.translation.width <= -triggerLimit)
                            {
                                currentMovingState = .Horizontal
                            }
                            
                            if (gesture.translation.height >= triggerLimit || gesture.translation.height <= -triggerLimit)
                            {
                                currentMovingState = .Vertical
                            }
                        }
                        .onEnded
                        {
                            value in
                            withAnimation(.spring())
                            {
                                
                                limitedOffset = CGSize.zero
                                sizeWidthKoef = 0
                                sizeHeightKoef = 0
                            }
                            offset = .zero
                            currentMovingState = .None
                            currentThumbstickState = .None
                            showLabel = true
                        }
                )
                
                Text(labelText)
                .foregroundColor(showLabel ? .white : Color(red: 0.2, green: 0.2, blue: 0.2))
                    .font(.custom("Helvetica", size: 40))
                    .frame(width: buttonSize, height: buttonSize)
                    .offset(x: limitedOffset.width, y: limitedOffset.height)
            
        }
        
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(currentThumbstickState: .constant(.North))
    }
}
