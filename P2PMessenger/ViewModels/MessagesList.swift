//
//  MessagesModel.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import Foundation

class MessagesList: ObservableObject {
    @Published var messages: [Message] = []
    
    init()
    {
        getMessages()
    }
    
    func getMessages()
    {
        let testMessages = [
            Message(from: "1", to: "2", content: "Hello", isMine: true),
            Message(from: "2", to: "1", content: "Hi", isMine: false),
            Message(from: "1", to: "2", content: "How are you?", isMine: true),
            Message(from: "2", to: "1", content: "Good", isMine: false),
            Message(from: "2", to: "1", content: "Wbu", isMine: false)
        ]
        
        messages.append(contentsOf: testMessages)
    }
    
    func append(_ message: Message) {
        messages.append(message)
    }
}
