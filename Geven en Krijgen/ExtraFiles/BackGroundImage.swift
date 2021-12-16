//
//  BackGroundImage.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 09/12/2021.
//

import SwiftUI

struct DefaultBackGroundImage: ViewModifier {
    
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .background(
                Image("IMG3")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .opacity(Double(opacity))
            )
    }
}

extension View {
    
    func withDefaultBackgroundImage(opacity: Double) -> some View {
        modifier(DefaultBackGroundImage(opacity: opacity))
    }
}


