//
//  Home.swift
//  UI-56
//
//  Created by にゃんにゃん丸 on 2020/11/30.
//

import SwiftUI

struct Home: View {
    
    @Binding var Filters : [item]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing : 15){
                
                ForEach(Filters){item in
                    
                    CardView(Item: item)
                    
                }
            }
            .padding()
        }
        
    }
}


