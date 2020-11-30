//
//  CardView.swift
//  UI-56
//
//  Created by にゃんにゃん丸 on 2020/11/30.
//

import SwiftUI

struct CardView: View {
    
    var Item :item
    @State var show = false
    var body: some View {
        HStack{
            Image(Item.name)
                .resizable()
                .frame(width: 65, height: 65)
                .cornerRadius(20)
        
        
        
        VStack{
            HStack{
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(Item.name)
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Text(Item.source)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    
                }
                
                Spacer(minLength: 0)
                
                VStack{
                
                Button(action: {
                    
                    show.toggle()
                    
                }){
                    
                    Text(show ? "Change" : "Tap")
                        .fontWeight(.heavy)
                        .padding(.vertical,10)
                        .padding(.horizontal,15)
                        .background(Color.primary.opacity(0.1))
                        .clipShape(Capsule())
                    
                }
                Text("All")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
            }
               
                
            }
            Divider()
            
            
        }
        
    }
        .padding()
}
}
