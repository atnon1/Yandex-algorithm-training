import Foundation

struct FillEvent: Comparable {
    enum Event {
        case start
        case end
    }
    let point: Int
    let event: Event
    
    static func < (lhs: FillEvent, rhs: FillEvent) -> Bool {
        lhs.point < rhs.point
    }
    static func == (lhs: FillEvent, rhs: FillEvent) -> Bool {
        lhs.point == rhs.point && lhs.event == rhs.event
    }
}

func readEvents() -> [FillEvent] {
    var events = [FillEvent]()
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let pair = readLine()!.components(separatedBy: " ").map { Int($0)! }
        events.append(FillEvent(point: pair[0], event: .start))
        events.append(FillEvent(point: pair[1], event: .end))
    }
    return events
}

func findFilledLength(of initialEvents: [FillEvent]) -> Int {
    let events = initialEvents.sorted()
    var fillingCnt = 0
    var filledLength = 0
    for i in 0..<events.count {
        if fillingCnt > 0 {
            filledLength += (events[i].point - events[i-1].point)
        }
        if events[i].event == .start {
            fillingCnt += 1
        } else {
            fillingCnt -= 1
        }
    }
    return filledLength
}

let events = readEvents()
print(findFilledLength(of: events))
