//
//  CountdownTimer.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/05.
//


import Foundation
import SwiftUI
import Combine

class StopWatch: ObservableObject {
    @Published var counter: Int = 0
    @Published var isRunning: Bool = false
    var timer = Timer()
    
    init(seconds: Int) {
        self.counter = seconds
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                                   repeats: true) { _ in
            if self.counter == 0 {
                self.timer.invalidate()
                return
            }
            self.counter -= 1
        }
    }
    func stop() {
        self.timer.invalidate()
    }
    func reset() {
        self.counter = 0
        self.timer.invalidate()
    }
}
