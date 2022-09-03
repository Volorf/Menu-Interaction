//
//  MenuButton.swift
//  Menu Interaction
//
//  Created by Oleg Frolov on 03/09/2022.
//

import SwiftUI

struct MenuButton: View {
    
    @State private var offset = CGSize.zero
    
    var body: some View {
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
//                                self.isBigg = true;
                        }
                        else
                        {
//                                self.isBigg = false
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
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton()
    }
}
