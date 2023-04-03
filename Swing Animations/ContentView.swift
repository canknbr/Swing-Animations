//
//  ContentView.swift
//  Swing Animations
//
//  Created by Can Kanbur on 3.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var girl = false
    @State var leftLeg = false
    @State var rightLeg = false
    
    let fadeOutRope = Gradient(colors: [.clear,.black])
    var body: some View {
        ZStack{
            Image("tree").resizable()
            .frame(width: 550,height: 900)
            ZStack{
                Image("leg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees( leftLeg ? -45 : 30),anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -455 , y : 90)
                    .animation(Animation.easeInOut(duration: 0.4).delay(1).repeatForever(autoreverses: true), value: leftLeg)
                    .onAppear(){
                        leftLeg.toggle()
                    }.zIndex(1)
                
                
                Image("leg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees( rightLeg ? -20 : 50),anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -448 , y : 92)
                    .animation(Animation.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: rightLeg)
                    .onAppear(){
                        rightLeg.toggle()
                    }
                
                
                Image("Girl").resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(0.25)
                    .offset(x:-300,y:0)
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57,height: 80)
                    .offset(x:-187,y: -100)
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57,height: 80)
                    .offset(x:-229,y: -108)
                
                
                
            }.rotationEffect(.degrees(girl ? -30 : -45),anchor: .top)
                .animation(Animation.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: girl)
                .onAppear(){
                    girl.toggle()
                }
            Image("leaves").resizable().aspectRatio(contentMode: .fit).frame(width: 400, height: 400).rotationEffect(Angle(degrees: -15),anchor: .trailing)
                .offset(x:-10,y:-180)
            
        }.frame(width: 950,height: 950)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
