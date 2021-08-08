//
//  SearchBarVR.swift
//  SearchBarUsingViewRepresentable
//
//  Created by Anurag Bhakuni on 06/08/21.
//

import SwiftUI

struct SearchBarVR: UIViewRepresentable {
    
    @Binding var seacrhBarText : String
    
    
    // Create the class to use with the searchBar delegate for the search string / text
    class Cordinator : NSObject, UISearchBarDelegate {
        
        @Binding var text : String
        
        init(text : Binding<String>) {
            _text = text
            print("Cordinator")
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    // Create coordinator for the search delegate
    func makeCoordinator() -> Cordinator {
        return Cordinator(text: $seacrhBarText)
    }
    
    
    func makeUIView(context: Context) -> UISearchBar {
        print("makeUIView")
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search"
        return searchBar
    }
    
    // Always copy the placeholder text across on update
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        print("updateUIView")
        uiView.text =  seacrhBarText
        
    }
    
    typealias UIViewType = UISearchBar
    
}

struct SearchBarVR_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarVR(seacrhBarText: .constant("test"))
    }
}
