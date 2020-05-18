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
    
    @Published var text = ""
    @Published var everyFiveSeconds = ""
    
    public func startTimer() {
        
        // so to keep adding values even when the timer is called we use a NEW instance of Timer than just cancelling and reassigning. Very interesting.
        
        subscriptions = []
                
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .lane("Timer")
            .sink(receiveValue: { value in
            self.text = value.description
            })
            .store(in: &subscriptions)
    }
}
