//
//  CustomNavigationView.swift
//  UI-56
//
//  Created by にゃんにゃん丸 on 2020/11/30.
//

import SwiftUI

struct CustomNavigationView :UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parcent: self)
    }
    
    let largtitle : Bool
    let title : String
    let placeholder : String
    
    let view : AnyView
    var onSearch : (String) -> ()
    var onChannel : () -> ()
    
    init(view:AnyView,placeholder:String? = "search",largtitle:Bool? = true,title:String?, onSearch:@escaping(String) -> (),onChannel: @escaping() -> ()) {
        self.title = title!
        self.largtitle = largtitle!
        self.placeholder = placeholder!
        
        self.view = view
        self.onSearch = onSearch
        self.onChannel = onChannel
        
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let childView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: childView)
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles  = largtitle
       
        
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeholder
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        
        return controller
        
        
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeholder
        
        uiViewController.navigationBar.prefersLargeTitles = largtitle
        
    }
    
    class Coordinator : NSObject,UISearchBarDelegate{
        
        let parcent : CustomNavigationView
        
        init(parcent : CustomNavigationView) {
            self.parcent = parcent
        }
        
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            self.parcent.onSearch(searchText)
            
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            self.parcent.onChannel()
            
        }
        
    }
}

