//
//  Verkopen.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI

struct VerkopenView: View {
    
    let advertisment = [
        ["1", "2"],
        ["3", "4"],
        ["5", "6"],
        ["7", "8"],
        ["9", "10"],
        ["11", "12"]
    ]
    
    private let imageL = Image(systemName: "plus.square.dashed")
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Geven en Krijgen")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            
            ScrollView {
                ForEach(advertisment, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            NavigationLink(destination: ProfielView()) {
                                Text("\(imageL) \(item)")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .frame(width: 175, height: 200)
                                    .background(.ultraThinMaterial)
                                    .shadow(color: Color(.gray).opacity(0.3), radius: 7, x: 0, y: 7)
                                    .cornerRadius(14)
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
        .withDefaultBackgroundImage(opacity: 0.5)

        
    }
}

struct Verkopen_Previews: PreviewProvider {
    static var previews: some View {
        VerkopenView()
    }
}
