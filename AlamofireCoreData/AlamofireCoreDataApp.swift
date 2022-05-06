//
//  AlamofireCoreDataApp.swift
//  AlamofireCoreData
//
//  Created by Nazar Babyak on 05.05.2022.
//

import SwiftUI

@main
struct AlamofireCoreDataApp: App {

    let persistanseControler = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanseControler.container.viewContext)
            
        }
    }
}
