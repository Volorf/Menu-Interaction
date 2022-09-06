//
//  ContentView.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 02/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentThumbstickState = Thumbstick.None
    @State private var counter: Int = 0
    
    private let offset: Double = 192

    
    var body: some View
    {
        ZStack()
        {
            Color(red: 0.133, green: 0.133, blue: 0.133)
            
            MenuButton(currentThumbstickState: $currentThumbstickState)
            
            MenuItem(labelName: "N", buttonThumbstickState: .West, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: -offset, y: 0)
            MenuItem(labelName: "P", buttonThumbstickState: .North, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: 0, y: -offset)
            MenuItem(labelName: "D", buttonThumbstickState: .East, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: offset, y: 0)
            MenuItem(labelName: "R", buttonThumbstickState: .South, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: 0, y: offset)
            
            
        }
        .ignoresSafeArea()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
