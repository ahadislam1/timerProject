//
//  ContentView.swift
//  timerProject
//
//  Created by Ahad Islam on 5/18/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var timerModel: TimerModel
    var buttonPressed: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(timerModel.text.isEmpty ? "Text" : timerModel.text)
            Button(action: buttonPressed) {
                Text("HIT ME")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static func something() {
        
    }
    
    static var previews: some View {
        ContentView(timerModel: TimerModel(), buttonPressed: something)
    }
}
