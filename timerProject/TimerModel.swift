//
//  TimerModel.swift
//  timerProject
//
//  Created by Ahad Islam on 5/18/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import Combine
import TimelaneCombine
import TimelaneCore

class TimerModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var subscription: AnyCancellable?
    
    private lazy var formatter: DateComponentsFormatter = {
        let f = DateComponentsFormatter()
        f.unitsStyle = .positional
        f.allowedUnits = [.minute, .second]
        f.zeroFormattingBehavior = .pad
        return f
    }()
    
    @Published var text = ""
    @Published var everyFiveSeconds = ""
    @Published var counter: TimeInterval = 0.0
    
    public func startTimer() {
        
        // so to keep adding values even when the timer is called we use a NEW instance of Timer than just cancelling and reassigning. Very interesting.
                
        subscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .lane("Timer")
            .sink(receiveValue: { value in
                self.counter += 1
                self.text = self.formatter.string(from: self.counter)!
            })
    }
    
    public func pauseTimer() {
        subscription = nil
    }
    
    public func stopTimer() {
        pauseTimer()
        counter = 0
    }
}
