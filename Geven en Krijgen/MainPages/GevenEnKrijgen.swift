//
//  GevenEnKrijgen.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//
//  This file 'GevenEnKrijgen' is one of the main pages of the app.
//  All the advertisements from the different users will be uplodaded here,
//  so that the users have a clear view of which goods are at offer.
//  Users can scroll down to see all the advertisements that are available.
//  The first three pictures as well as the short description of the page
//  will be shown in the view.
//  In a updates version of this app users will be able to navigate to the
//  different advertisements to see more information and react on the
//  advertisement.
//

import SwiftUI

struct GevenEnKrijgenView: View {
    
    @StateObject private var vm = CloudKitPlaatsAdvertentieViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Geven en Krijgen")
                .fontWeight(.bold)
                .font(.largeTitle)
            ScrollView(.vertical) {
                ForEach(vm.returnedItems, id: \.id) {item in
                    NavigationLink {
                        // add a new advertationView
                    } label: {
                        VStack(spacing: -5){
                            HStack {
                                if let url1 = item.imageURL1, let data1 = try? Data(contentsOf: url1), let image1 = UIImage(data: data1) {
                                    Image(uiImage: image1)
                                        .resizable()
                                        .frame(width: 210, height: 170)
                                }
                                
                                VStack {
                                    if let url2 = item.imageURL2, let data2 = try? Data(contentsOf: url2), let image2 = UIImage(data: data2) {
                                        Image(uiImage: image2)
                                            .resizable()
                                            .frame(width: 100, height: 80)
                                    } else {
                                        Rectangle()
                                            .frame(width: 100, height: 80)
                                            .overlay(
                                                Text("geen foto")
                                                    .frame(width: 75, height: 45)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                        
                                    if let url3 = item.imageURL3, let data3 = try? Data(contentsOf: url3), let image3 = UIImage(data: data3) {
                                        Image(uiImage: image3)
                                            .resizable()
                                            .frame(width: 100, height: 80)
                                    } else {
                                        Rectangle()
                                            .frame(width: 100, height: 80)
                                            .overlay(
                                                Text("geen foto")
                                                    .frame(width: 75, height: 45)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                }
                            }
                            
                            Rectangle()
                                .background(Color.blue.opacity(0.05))
                                .frame(width: UIScreen.main.bounds.width - 72.5, height: 25)
                                .overlay(
                                    Text("\(item.koBeschrijving)")
                                            .foregroundColor(.white)
                                    )
                        }
                        .background(Rectangle())
                        .padding(.bottom)
                    }
                }
            }
        }
        .withDefaultBackgroundImage(opacity: 0.5)
        .padding(20)
    }
}

struct GevenEnKrijgen_Previews: PreviewProvider {
    static var previews: some View {
        GevenEnKrijgenView()
    }
}
