//
//  Message.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import Foundation

struct Message: Identifiable, Codable {
    
    let id: String
    let from: String
    let to: String
    let content: String
    let isMine: Bool
    
    init(from: String, to: String, content: String, isMine: Bool)
    {
        self.id = UUID().uuidString
        self.from = from
        self.to = to
        self.content = content
        self.isMine = isMine
    }
    
}
