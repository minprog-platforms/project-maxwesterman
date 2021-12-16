//
//  Profiel.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI

struct ProfielView: View {
    
    @State var zonnetjes: Int = 700
    @State var name: String = "Max Westerman"
    @State var area: String = "Randwijck"
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    HeadProfile(zonnetjes: zonnetjes)
                        .padding(30)
                    
                    Text(name)
                        .font(.title)
                        .bold()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack{
                        Image(systemName: "location.circle")
                        Text("Buurt: \(area)")
                    }
                    
                    HStack{
                        Image(systemName: "sun.max.fill")
                        Text("Zonnetjes: \(zonnetjes)")
                    }
                }
                .padding()
            
                NavigationLink(destination: PlaatsAdvertentie()) {
                    
                    Text("Plaats advertentie \(Image(systemName: "sun.max.fill"))")
                        .bold()
                        .frame(width: 260, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(30)

                Spacer()
                Spacer()
                Spacer()
                
            }
            .padding(20)
            .withDefaultBackgroundImage(opacity: 0.3)
        }
    }
}

struct Profiel_Previews: PreviewProvider {
    static var previews: some View {
        ProfielView()
    }
}


struct HeadProfile: View {
    
    @State var zonnetjes: Int
    
    var body: some View {
        VStack {
            if zonnetjes < 200 {
                Image("IMG2")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }
            else if zonnetjes > 200 && zonnetjes < 500 {
                Image("IMG2")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Image(systemName: "crown")
                            .resizable()
                            .frame(width: 75, height: 35)
                            .foregroundColor(.yellow),
                        alignment: .top
                        
                    )
            }
            else if zonnetjes > 500 {
                Image("IMG2")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Image(systemName: "crown.fill")
                            .resizable()
                            .frame(width: 75, height: 35)
                            .foregroundColor(.yellow),
                        alignment: .top
                    )
            }
        }
    }
}
