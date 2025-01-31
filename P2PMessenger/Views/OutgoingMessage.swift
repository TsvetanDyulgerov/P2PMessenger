//
//  OutgoingMessage.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import SwiftUI

struct OutgoingMessage: View {
    
    let backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    let textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let accentColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    let content: String
    
    var body: some View {
        HStack{
            
            Spacer()
            
            Text(content)
                .foregroundStyle(Color(textColor))
                .bold()
                .padding(10)
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
                .frame(minWidth: 40, maxWidth: 250, maxHeight: 900, alignment: .trailing)
                .fixedSize(horizontal: false, vertical: false)
                .lineLimit(nil)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            
        }
    }
}

#Preview {
    OutgoingMessage(content: "OK")
}
