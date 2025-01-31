//
//  ConnectionRequest.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import Foundation

struct ConnectionRequest: Identifiable, Codable {
    
    let id: String
    let from: String
    let to: String
    
    init(id: String = UUID().uuidString, from: String, to: String)
    {
        self.id = id
        self.from = from
        self.to = to
    }
    
}
