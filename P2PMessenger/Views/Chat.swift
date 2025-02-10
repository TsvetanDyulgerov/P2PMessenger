//
//  Chat.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 31/01/2025.
//

import SwiftUI

struct Chat: View {
    
    let backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    let textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let accentColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    @State var message: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var messagesList: MessagesList
    
    let connection: ConnectionRequest
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Connected: " + connection.to)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color(textColor))
                
                
                Button {
                    terminateButton()
                } label: {
                    Rectangle()
                        .fill(.red)
                        .border(Color(textColor), width: 1)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .overlay {
                            Text("Terminate")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color(textColor))
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color(accentColor))
            
            ScrollView{
                
                ForEach(messagesList.messages) { message in
                    if message.isMine {
                        OutgoingMessage(content: message.content)
                    }
                    else{
                        IncomingMessage(content: message.content)
                    }
                }
                
                
            }
            
            HStack {
                TextEditor(text: $message)
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, minHeight: 35)
                    .scrollContentBackground(.hidden)
                    .background(Color(accentColor))
                    .foregroundStyle(Color(textColor))
                    .cornerRadius(8)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(maxHeight: 400, alignment: .bottom)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 20)
                    .padding(.vertical, 10)
                
                sendButton(isEnabled: message.count > 0)
                
            }
            
        }
        .toolbar(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(backgroundColor))
    }
    
    func sendButton(isEnabled: Bool) -> some View
    {
        Button {
            messagesList.append(message, isMine: true, from: "1", to: connection.to)
            
        } label: {
            Image(systemName: "paperplane.fill")
                .font(.system(size: 25))
                .foregroundColor(isEnabled ? Color.blue : Color(accentColor))
                .padding(.trailing, 30)
                .padding(.leading, 20)
                .padding(.vertical, 15)
        }
        .disabled(!isEnabled)
    }
    
    func terminateButton()
    {
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct Chat_Previews: PreviewProvider {
    
    static var testConnection = ConnectionRequest(from: "127.0.0.1", to: "174.123.123.12")
    
    static var previews: some View {
        NavigationView{
            Chat(connection: testConnection)
                .toolbar(.hidden)
        }
        .environmentObject(MessagesList())
        
    }
}
