//
//  ContentView.swift
//  UI-56
//
//  Created by にゃんにゃん丸 on 2020/11/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var FiltersItems = items
    var body: some View {
        CustomNavigationView(view: AnyView(Home(Filters: $FiltersItems)), placeholder: "Search", largtitle: true, title: "Title",onSearch: { (txt) in
            
            if txt != ""{
                
                self.FiltersItems = items.filter{$0.name.lowercased().contains(txt.lowercased())}
            }
            else{
                self.FiltersItems = items
                
                
            }
            
        
            
            
        }, onChannel: {
            
            self.FiltersItems = items
            
        })
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
