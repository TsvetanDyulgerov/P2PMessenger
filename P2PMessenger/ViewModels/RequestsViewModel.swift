//
//  RequestsViewModel.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import Foundation


class RequestsViewModel: ObservableObject {
    @Published var requests: [ConnectionRequest] = []
    
    init(){
        getRequests()
    }
    
    func getRequests()
    {
        let newRequests = [
            ConnectionRequest(from: "174.123.123.12", to: "174.123.123.12"),
            ConnectionRequest(from: "174.123.123.12", to: "174.123.123.12"),
            ConnectionRequest(from: "174.123.123.12", to: "174.123.123.12")
        ]
        
        requests.append(contentsOf: newRequests)
    }
}
