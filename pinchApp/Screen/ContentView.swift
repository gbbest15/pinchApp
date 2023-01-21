//
//  ContentView.swift
//  pinchApp
//
//  Created by G BEN on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetValue : CGSize = .zero
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
                    .offset(x: offsetValue.width, y: offsetValue.height)
                    .gesture(TapGesture(count: 2).onEnded({ Void in
                        if scaleEffectValue == 1 {
                            withAnimation(.spring()) {
                                scaleEffectValue = 5
                            }
                        }else{
                            withAnimation(.spring()) {
                                scaleEffectValue = 1
                                offsetValue = .zero
                            }
                        }
                    })
                    )
                    .gesture(DragGesture().onChanged({ value in
                        let dragOffset = value.translation
                        withAnimation(.linear(duration: 1)) {
                            offsetValue = dragOffset
                        }
                    }).onEnded({ _ in
                        if scaleEffectValue <= 1 {
                            withAnimation(.linear(duration: 1)) {
                                scaleEffectValue = 1
                                offsetValue = .zero
                            }
                        }
                    })
                    ).gesture(MagnificationGesture().onChanged({ value in

                        if scaleEffectValue >= 1 && scaleEffectValue <= 5 {
                            scaleEffectValue = value
                        } else if scaleEffectValue > 5 {
                            scaleEffectValue = 5
                        }else {
                            withAnimation(.easeOut(duration: 1)) {
                                scaleEffectValue = 1
                            }
                          
                        }
                    }))
                
                
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
