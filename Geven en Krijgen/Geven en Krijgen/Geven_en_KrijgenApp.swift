//
//  Geven_en_KrijgenApp.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 06/12/2021.
//

import SwiftUI

@main
struct Geven_en_KrijgenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            PlaatsAdvertentie()
//            CloudKitCrud()
//            CloudKitUser()
            AppTabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
