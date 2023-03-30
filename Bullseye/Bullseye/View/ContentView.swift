//
//  ContentView.swift
//  Bullseye
//
//  Created by Ajesh Nair on 14/11/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue : Double = 10.0
    @State private var game: Game  = Game()
    
    var body: some View {
            VStack {
                VStack {
                        Text("🎯🎯🎯\nPUT THE BULLS EYE AS CLOSE AS YOU CAN TO")
                        .bold()
                        .kerning(2.0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.footnote)
                    Text(String(game.target))
                        .kerning(-1.0)
                        .font(.largeTitle)
                        .fontWeight(.black)

                }
                HStack {
                    Text("1")
                        .bold()
                    .font(.body)
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .font(.body)
                        .bold()
                }
                Button(action: {
                    self.alertIsVisible = true
                }){
                    Text("Hit me")
                }.alert(isPresented: $alertIsVisible){
                    let sliderValueRounded: Int = Int(sliderValue)
                    return Alert(
                        title: Text("Hello there"),
                        message: Text("The slider value is \(sliderValueRounded)\n" + "You scored \(self.game.points(sliderValue: sliderValueRounded)) points this round."),
                        dismissButton: .default(Text("Awesomw"))
                    )
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
