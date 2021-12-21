//
//  Optional.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//
//  The file 'Optional' is a optional View that can be of use once a
//  new feature is implemented, such as a selling goods view.
//  Since this view is not in use, there is no link between a running file
//  and this file.
//

import SwiftUI

struct OptionalView: View {
    
    var body: some View {
        VStack {
            Text("Optional View")
        }
        .padding(20)
        .withDefaultBackgroundImage(opacity: 0.2)
    }
}

struct Optional_Previews: PreviewProvider {
    static var previews: some View {
        OptionalView()
    }
}
