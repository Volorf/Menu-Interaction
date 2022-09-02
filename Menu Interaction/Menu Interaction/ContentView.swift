//
//  ContentView.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 02/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset = CGSize.zero
    @State private var isBigg: Bool = false;
    
    var body: some View
    {
        ZStack()
        {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .offset(x: offset.width > offset.height ? offset.width : 0, y: offset.height > offset.width ? offset.height : 0)
                .gesture(
                    DragGesture()
                        .onChanged
                        {
                            gesture in offset = gesture.translation
                            print("offset:  \(offset)")
                            
                            if(gesture.translation.width >= 50)
                            {
                                self.isBigg = true;
                            }
                            else
                            {
                                self.isBigg = false
                            }
                        }
                        .onEnded
                        { value in
                            withAnimation(.spring())
                            {
                            offset = .zero
                            }
                        }
                )
            
            MenuItem(isActive: $isBigg, labelName: "Settings")
                .offset(x: -100, y: 0)
            MenuItem(isActive: $isBigg, labelName: "Create")
                .offset(x: 0, y: 100)
            MenuItem(isActive: $isBigg, labelName: "Library")
                .offset(x: 100, y: 0)
            MenuItem(isActive: $isBigg, labelName: "Save")
                .offset(x: 0, y: -100)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
