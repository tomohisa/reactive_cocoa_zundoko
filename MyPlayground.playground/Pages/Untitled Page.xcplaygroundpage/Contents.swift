import Foundation
import Result
import ReactiveCocoa

enum Zundoko: UInt32 {
    case ズン
    case ドコ
}

//timer(0.5, onScheduler: QueueScheduler()).map {
//    _ in Zundoko(rawValue: arc4random_uniform(2))!
//    }.on(next: {
//        print($0)
//    }).scan([]) { (array, value) in
//        Array(array + [value]).suffix(5)
//    }.takeWhile { $0 != [.ズン, .ズン, .ズン, .ズン, .ドコ] }
//    .startWithCompleted {
//        print("キ・ヨ・シ！")
//}

let river = timer(0.5, onScheduler: QueueScheduler()).map {
    _ in Zundoko(rawValue: arc4random_uniform(2))!
}
//let observer = Observer<Zundoko,NoError>();
//
//river.start(observer)
//
//Observer


//let baseProducer = SignalProducer<Int, NoError>(values: [1, 2])
//
//var counter = 0
//let transform = { (signal: Signal<Int, NoError>) -> Signal<Int, NoError> in
//    counter += 1
//    return signal
//}
//
//let producer = baseProducer.lift(transform)
//expect(counter) == 0
//
//producer.start()
//expect(counter) == 1
//
//producer.start()

let lifted = river.lift { (base:Signal<Zundoko, NoError>) -> Signal<Zundoko, NoError> in
    print("lifted")
    base.observeNext({print($0)})
    return base
}

lifted.start()

//river.takeUntil(SignalProducer<(), NoError> {
//    
//    })


//let trigger = river.scan([])
//    { (array, value) in Array(array+[value]).suffix(5)
//    }.skipWhile{$0 != [.ズン, .ズン, .ズン, .ズン, .ドコ]}.map { (_) -> () in
//        return;
//    }

//river.takeUntil(trigger)
//    
//    .on(completed: {
//        print("キ・ヨ・シ！")
//    }, next: {
//        print($0)
//    }).start()


import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
