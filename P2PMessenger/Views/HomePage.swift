//
//  HomePage.swift
//  P2PMessenger
//
//  Created by Tsvetan Dyulgerov on 30/01/2025.
//

import SwiftUI

struct HomePage: View {
    
    let backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    let textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let accentColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    let myIP: String = "192.168.1.100"
    
    @State var inputIP: String = ""
    
    @EnvironmentObject var requestsViewModel: RequestsViewModel
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                Spacer()
                
                Text("Your IP Adress:")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(textColor))
                
                Text(myIP)
                    .font(.title2)
                    .foregroundStyle(Color(textColor))
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color(accentColor))
                    .clipShape(.rect(cornerRadius: 6))
                    .padding(.horizontal, 20)
                
                HStack {
                    Text("Request Connection")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color(textColor))
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                
                TextField("Connection IP...", text: $inputIP)
                
                    .font(.title2)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(textColor))
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color(accentColor))
                    .clipShape(.rect(cornerRadius: 6))
                    .padding(.horizontal, 20)
                
                HStack {
                    Button {
                        
                    } label: {
                        Rectangle()
                            .frame(width: 150, height: 45)
                            .foregroundColor(.blue)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                Text("Send")
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(Color(textColor))
                            )
                            .padding(.all, 20)
                    }
                    
                    Button {
                        
                    } label: {
                        Rectangle()
                            .frame(width: 160, height: 45)
                            .foregroundColor(Color(accentColor))
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                Text("Cancel")
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(Color(textColor))
                            )
                            .padding(.all, 20)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color(backgroundColor))
            
            
            VStack {
                Text("Incomming Requests:")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color(textColor))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.vertical, 20)
                
                
                ScrollView{
                    ForEach(requestsViewModel.requests){
                        item in Request(request: item)
                    }
                }
            }
            .background(Color(backgroundColor))
        }
        .toolbar(.hidden)
    }
}

#Preview {
    NavigationView{
        HomePage()
    }
        .environmentObject(RequestsViewModel())
        .environmentObject(MessagesList())
}
