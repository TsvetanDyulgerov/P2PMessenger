//
//  IncommingRequest.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import SwiftUI

struct Request: View {
    
    let backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    let textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let accentColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    let request: ConnectionRequest
    
    var body: some View {
        Rectangle()
            .fill(Color(backgroundColor))
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .border(Color(accentColor), width: 1)
            .overlay(
                HStack{
                    Text(request.from)
                        .font(.headline)
                        .foregroundStyle(Color(textColor))
                        .padding(.all, 20)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chat(connection: request),
                        label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(textColor))
                                .padding(.all, 20)
                        }
                    
                    )
                    
                }
            )
    }
}

struct RequestList_Previews: PreviewProvider {
    
    static var testRequest = ConnectionRequest(from: "199.168.1.100" , to: "199.168.1.1")
    
    static var previews: some View {
        Request(request: testRequest)
    }
}
