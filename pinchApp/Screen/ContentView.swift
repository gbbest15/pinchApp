//
//  ContentView.swift
//  pinchApp
//
//  Created by G BEN on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                
            }
            .navigationTitle("Pich App")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
