//
//  TabBarItem.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//
//
//}


enum TabBarItem: Hashable {
    case Profiel, GevenEnKrijgen, Verkopen, Instellingen
    
    var iconName: String {
        switch self {
        case .Profiel: return "person"
        case .GevenEnKrijgen: return "heart"
        case .Verkopen: return "house"
        case .Instellingen: return "gearshape"
        }
    }
    
    var title: String {
        switch self {
        case .Profiel: return "profiel"
        case .GevenEnKrijgen: return "Geven Krijgen"
        case .Verkopen: return "Verkopen"
        case .Instellingen: return "Instellingen"
        }
    }
    
    var color: Color {
        switch self {
        case .Profiel: return Color.red
        case .GevenEnKrijgen: return Color.blue
        case .Verkopen: return Color.orange
        case .Instellingen: return Color.green
        }
    }
    
}
