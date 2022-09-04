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
    let changeStateTriggerLimit: CGFloat = 64
    @State private var currentMovingState: MovingState = .None
    @State private var limitedOffset = CGSize.zero
    
    private let buttonSize: Double = 128
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: buttonSize, height: buttonSize)
            .offset(x: limitedOffset.width, y: limitedOffset.height)
            .gesture(
                DragGesture()
                    .onChanged
                    {
                        gesture in offset = gesture.translation
                        print("offset:  \(offset)")
                        
                        if(currentMovingState == .Horizontal)
                        {
                            
                            
                            if (offset.width >= changeStateTriggerLimit)
                            {
                                currentThumbstickState = .East
                                return
                            }
                            
                            if (offset.width <= -changeStateTriggerLimit)
                            {
                                currentThumbstickState = .West
                                return
                            }
                            
                            limitedOffset.width = offset.width;
                        }
                        
                        if(currentMovingState == .Vertical)
                        {
                            
                            
                            if (offset.height >= changeStateTriggerLimit)
                            {
                                currentThumbstickState = .South
                                return
                            }
                            
                            if (offset.height <= -changeStateTriggerLimit)
                            {
                                currentThumbstickState = .North
                                return
                            }
                            
                            limitedOffset.height = offset.height
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
                        }
                        offset = .zero
                        currentMovingState = .None
                        currentThumbstickState = .None
                    }
            )
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(currentThumbstickState: .constant(.North))
    }
}
