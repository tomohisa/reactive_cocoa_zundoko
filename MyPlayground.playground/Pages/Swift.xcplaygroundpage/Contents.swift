import Foundation
import Result
import ReactiveCocoa

enum Zundoko: UInt32 {
    case ズン
    case ドコ
}

timer(0.5, onScheduler: QueueScheduler()).map {
    _ in Zundoko(rawValue: arc4random_uniform(2))!
    }.on(next: {
        print($0)
    }).scan([]) { (array, value) in
        Array(array + [value]).suffix(5)
    }.takeWhile { $0 != [.ズン, .ズン, .ズン, .ズン, .ドコ] }
    .startWithCompleted {
        print("キ・ヨ・シ！")
    }

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
