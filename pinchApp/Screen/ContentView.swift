//
//  ContentView.swift
//  pinchApp
//
//  Created by G BEN on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animatedValue:Bool = false
    @State private var scaleEffectValue:CGFloat = 1
    var body: some View {
        NavigationView{
            ZStack{
                Image("magazine-front-cover")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                    .scaleEffect(scaleEffectValue)
                    .gesture(TapGesture(count: 2).onEnded({ Void in
                        if scaleEffectValue == 1 {
                            withAnimation(.spring()) {
                                scaleEffectValue = 5
                            }
                        }else{
                            withAnimation(.spring()) {
                                scaleEffectValue = 1
                            }
                        }
                    })
                    )
            }
            .navigationTitle("Pich App")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation {
                    animatedValue = true
                }
            }
        }
        .navigationViewStyle(.stack)
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
