//
//  MenuButton.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 03/09/2022.
//

import SwiftUI

struct MenuButton: View {
    
    @Binding var currentThumbstickState: Thumbstick
    @Binding var hasThumbstickBeenReleased: Bool
    @Binding var showItems: Bool
    @Binding var hasSomethingBeenChanged: Bool
    
    @State private var offset = CGSize.zero
    @State private var currentMovingState: MovingState = .None
    @State private var limitedOffset = CGSize.zero
    @State private var sizeWidthKoef: Double = 0.0
    @State private var sizeHeightKoef: Double = 0.0
    @State private var somethingChangedObserver: Bool = false
    @State private var labelText: String = "P"
    
    private let triggerLimit: Double = 10
    private let changeStateTriggerLimit: CGFloat = 64 + 128
    private let fullSize: Double = 128 + 64
    private let buttonSize: Double = 128
    private let animDur: Double = 0.3
    
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
                    DragGesture(minimumDistance: 0)
                        .onChanged
                        {
            
                            gesture in offset = gesture.translation
                            
                            hasThumbstickBeenReleased = false
                            showItems = true
                            
                            hasSomethingBeenChanged = somethingChangedObserver
                            
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
                                    
                                    somethingChangedObserver = true
                                    
                                    return
                                }
                                
                                if (offset.width <= -changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .West
                                    limitedOffset.width = -changeStateTriggerLimit
                                    sizeWidthKoef = fullSize
                                    
                                    labelText = "N"
                                    
                                    somethingChangedObserver = true
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
                                    
                                    somethingChangedObserver = true
                                    return
                                }
                                
                                if (offset.height <= -changeStateTriggerLimit)
                                {
                                    currentThumbstickState = .North
                                    limitedOffset.height = -changeStateTriggerLimit
                                    sizeHeightKoef = fullSize
                                    
                                    labelText = "P"
                                    
                                    somethingChangedObserver = true
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
                            withAnimation(.spring(response: 0.7,
                                                  dampingFraction: 0.9,
                                                  blendDuration: 0.0))
                            {
                                
                                limitedOffset = CGSize.zero
                                sizeWidthKoef = 0
                                sizeHeightKoef = 0
                            }
                            offset = .zero
                            currentMovingState = .None
//                            currentThumbstickState = .None
                            hasThumbstickBeenReleased = true
                            showItems = false
                            somethingChangedObserver = false
                        }

                )
                
                Text(labelText)
                .foregroundColor(.white)

                    .font(.custom("AeonikMonoTRIAL-Bold", size: 40))
                    .frame(width: buttonSize, height: buttonSize)
                    .offset(x: limitedOffset.width, y: limitedOffset.height)
                    .opacity(showItems ? 0 : 1)
                    .animation(.easeOut(duration: hasSomethingBeenChanged ? 0 : animDur), value: showItems ? 0 : 1)
                    .allowsHitTesting(false)
                    
            
        }
        .statusBar(hidden: true)
        
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(currentThumbstickState: .constant(.North), hasThumbstickBeenReleased: .constant(false), showItems: .constant(false), hasSomethingBeenChanged: .constant(true))
    }
}
