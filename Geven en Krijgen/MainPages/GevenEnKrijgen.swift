//
//  GevenEnKrijgen.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI


struct GevenEnKrijgenView: View {
    
    @StateObject private var vm = CloudKitPlaatsAdvertentieViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Geven en Krijgen")
                .fontWeight(.bold)
                .font(.largeTitle)

            
            List {
                ForEach(vm.returnedItems, id: \.id) {item in
                    VStack {
                        Text(item.koBeschrijving)
                        Text(item.laBeschrijving)
//                        Image(uiImage: item.image1)
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            
            
//                            Text("\($0) \(row)")
//                                .bold()
//                                .foregroundColor(.black)
//                                .font(.largeTitle)
//                                .frame(width: 175, height: 200)
//                                .background(.ultraThinMaterial)
//                                .shadow(color: Color(.gray).opacity(0.3), radius: 7, x: 0, y: 7)
//                                .cornerRadius(20)
//                                .opacity(0.5)
        }
        .padding(20)
        .withDefaultBackgroundImage(opacity: 0.5)
    }
}

struct GevenEnKrijgen_Previews: PreviewProvider {
    static var previews: some View {
        GevenEnKrijgenView()
    }
}
