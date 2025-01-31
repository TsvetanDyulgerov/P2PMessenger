//
//  P2PMessengerApp.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 30/01/2025.
//

import SwiftUI

@main
struct P2PMessengerApp: App {
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                HomePage()
            }
            .environmentObject(RequestsViewModel())
        }
    }
}
