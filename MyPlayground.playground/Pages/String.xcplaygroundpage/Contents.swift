import Foundation
import Result
import ReactiveCocoa

timer(0.5, onScheduler: QueueScheduler()).map {
    _ in arc4random_uniform(2)==0 ? "ズン" : "ドコ"
    }.on(next: {
        print($0)
    }).scan([]) { (array, value) in
        Array(array + [value]).suffix(5)
    }.takeWhile { $0 != ["ズン", "ズン", "ズン", "ズン", "ドコ"] }
    .startWithCompleted {
        print("キ・ヨ・シ！")
}

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
