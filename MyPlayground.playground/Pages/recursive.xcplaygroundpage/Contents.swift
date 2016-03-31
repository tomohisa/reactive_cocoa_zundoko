import Foundation
import Result
import ReactiveCocoa

enum Zundoko: UInt32 {
    case ズン
    case ドコ
}

let producer = timer(0.5, onScheduler: QueueScheduler()).map {
    _ in Zundoko(rawValue: arc4random_uniform(2))!
    }.on(next: {
        print($0)
    }).scan([]) { (array, value) in
        Array(array + [value]).suffix(5)
    }.takeWhile { $0 != [.ズン, .ズン, .ズン, .ズン, .ドコ] }

func recursive(){
    producer.startWithSignal { (signal, Disposable) in
        signal.observeCompleted({
            print("キヨシ")
            recursive()
        })
    }
}

recursive()

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
