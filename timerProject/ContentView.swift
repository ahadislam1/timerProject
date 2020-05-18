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
    @State private var isOff = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text(convertToDateTime())
            Text("\(timerModel.counter)")
            Text(timerModel.text.isEmpty ? "Text" : timerModel.text)
            HStack(spacing: 8) {
                Button(action: startTimer) {
                    Text("PLAY")
                }
                .disabled(isOff)
                Button(action: pauseTimer) {
                    Text("PAUSE")
                }
                .disabled(!isOff)
                Button(action: stopTimer) {
                    Text("STOP")
                }
                .disabled(!isOff)
            }
        }
    }
    
    private func startTimer() {
        timerModel.startTimer()
        isOff.toggle()
    }
    
    private func pauseTimer() {
        timerModel.pauseTimer()
        isOff.toggle()
    }
    
    private func stopTimer() {
        timerModel.stopTimer()
        isOff.toggle()
    }
    
    private func convertToDateTime() -> String {
        let formaterr = DateComponentsFormatter()
        formaterr.unitsStyle = .positional
        formaterr.allowedUnits = [.minute, .second]
        formaterr.zeroFormattingBehavior = [.pad]
        
        return formaterr.string(from: 5.0)!
    }
}

struct ContentView_Previews: PreviewProvider {
    static func something() {
        
    }
    
    static var previews: some View {
        ContentView()
    }
}
