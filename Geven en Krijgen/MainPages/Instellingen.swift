//
//  Instellingen.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//
//  Summary 'Geven en Krijgen' - Instellingen
//  The 'Instellingen' View file is a preview of the possible settings and
//  the design of the setting page. The functionality of this page is still
//  limited, since none of the setting options work.
//


import SwiftUI

struct InstellingenView: View {
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: Text("Verbindingen"),
                        footer: Text("verbinding instellingen -- 1. 'online modus' - zet aan voor online activiteiten. -- 2. 'Gebruik systeem instellingen' - zet aan voor normaal gebruik.")) {
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Online modus")
                    })
                    
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Gebruik systeem instellingen")
                    })
                }
                
                Section {
                    Label("Druk hier voor uitnodigingslink!", systemImage: "link")
                }
            }
            .navigationTitle("Instellingen")
            .withDefaultBackgroundImage(opacity: 0.5)
        }
    }
}

struct Instellingen_Previews: PreviewProvider {
    static var previews: some View {
        InstellingenView()
    }
}
