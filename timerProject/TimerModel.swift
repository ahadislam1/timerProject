//
//  TimerModel.swift
//  timerProject
//
//  Created by Ahad Islam on 5/18/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation
import Combine

class TimerModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let timer = Timer.publish(every: 1, tolerance: nil, on: .main, in: .common, options: nil)
    
    @Published var text = ""
    @Published var everyFiveSeconds = ""
    
    public func startTimer() {
        subscriptions = []
        
        timer
            .autoconnect()
            .print()
            .sink { value in
                self.text = value.description
        }
        .store(in: &subscriptions)
    }
}