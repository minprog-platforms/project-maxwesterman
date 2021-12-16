//
//  Instellingen.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI

struct InstellingenView: View {
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: Text("Display"),
                        footer: Text("uitleg... ... ... ... ...")) {
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Dark mode")
                    })
                    
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Use system settings")
                    })
                }
                
                Section {
                    Label("Follow me on twitter", systemImage: "link")

                }
                  
            }
            .navigationTitle("Instellingen")
            
            
        }
        .withDefaultBackgroundImage(opacity: 0.5)

    }
}

struct Instellingen_Previews: PreviewProvider {
    static var previews: some View {
        InstellingenView()
    }
}
