import Foundation

struct CargoEvent: Comparable {
    enum Event: Int {
        case arrival = 1
        case departure = 0
    }
    let timePoint: Int
    let type : Event
    
    static func < (lhs: CargoEvent, rhs: CargoEvent) -> Bool {
        lhs.timePoint < rhs.timePoint ||
            (lhs.timePoint == rhs.timePoint && lhs.type.rawValue < rhs.type.rawValue)
    }
    static func == (lhs: CargoEvent, rhs: CargoEvent) -> Bool {
        lhs.timePoint == rhs.timePoint && lhs.type == rhs.type
    }

}

func readCargoEvents() -> [CargoEvent] {
    let n = Int(readLine()!)!
    var cargoEvents = [CargoEvent]()
    for _ in 0..<n {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        cargoEvents.append(CargoEvent(timePoint: input[0], type: .arrival))
        cargoEvents.append(CargoEvent(timePoint: input[0]+input[1], type: .departure))
    }
    return cargoEvents
}

func findMaxCargosSimultaneously(during cargoEvents: [CargoEvent]) -> Int {
    let events = cargoEvents.sorted()
    var maxCargosSimultaneously = 0
    var currentCargosCnt = 0
    for event in events {
        if event.type == .arrival {
            currentCargosCnt += 1
            maxCargosSimultaneously = max(maxCargosSimultaneously, currentCargosCnt)
        } else {
            currentCargosCnt -= 1
        }
    }
    return maxCargosSimultaneously
}

let events = readCargoEvents()

print(findMaxCargosSimultaneously(during: events))
