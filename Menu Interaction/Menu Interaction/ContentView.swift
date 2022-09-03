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

    
    var body: some View
    {
        ZStack()
        {
            MenuButton(currentThumbstickState: $currentThumbstickState)
            
            MenuItem(labelName: "Settings", buttonThumbstickState: .West, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: -100, y: 0)
            MenuItem(labelName: "Create", buttonThumbstickState: .North, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: 0, y: -100)
            MenuItem(labelName: "Library", buttonThumbstickState: .East, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: 100, y: 0)
            MenuItem(labelName: "Save", buttonThumbstickState: .South, currentThumbstickState: $currentThumbstickState, counter: $counter)
                .offset(x: 0, y: 100)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
