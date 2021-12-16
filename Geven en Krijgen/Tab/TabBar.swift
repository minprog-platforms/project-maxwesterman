//
//  TabBar.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    
    @State private var selection: String = "profiel"
    @State private var tabSelection: TabBarItem = .Profiel
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ProfielView()
                .tabBarItem(tab: .Profiel, selection: $tabSelection)
            
            
            GevenEnKrijgenView()
                .tabBarItem(tab: .GevenEnKrijgen, selection: $tabSelection)

            
//            VerkopenView()
//                .tabBarItem(tab: .Verkopen, selection: $tabSelection)

            
            InstellingenView()
                .tabBarItem(tab: .Instellingen, selection: $tabSelection)

        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}

