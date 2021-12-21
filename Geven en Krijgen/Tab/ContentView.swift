//
//  ContentView.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//
//  Summery 'Geven en Krijgen' - ContentView
//  The main content of the app is the tabbar which directs the user to the main pages:
//  ProfileView, Goods overview and settings.
//  Also there is a optional pre-made view if a new function should be added.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: String = "profiel"
    @State private var tabSelection: TabBarItem = .Profiel
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ProfielView()
                .tabBarItem(tab: .Profiel, selection: $tabSelection)
            
            GevenEnKrijgenView()
                .tabBarItem(tab: .GevenEnKrijgen, selection: $tabSelection)

            InstellingenView()
                .tabBarItem(tab: .Instellingen, selection: $tabSelection)
            
//            OptionalView()
//                .tabBarItem(tab: .Verkopen, selection: $tabSelection)
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
