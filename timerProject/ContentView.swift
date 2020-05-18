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
    
    @ObservedObject var timerModel = TimerModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text(timerModel.text.isEmpty ? "Text" : timerModel.text)
            HStack(spacing: 8) {
                Button(action: timerModel.startTimer) {
                    Text("PLAY")
                }
                Button(action: timerModel.pauseTimer) {
                    Text("PAUSE")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static func something() {
        
    }
    
    static var previews: some View {
        ContentView()
    }
}
