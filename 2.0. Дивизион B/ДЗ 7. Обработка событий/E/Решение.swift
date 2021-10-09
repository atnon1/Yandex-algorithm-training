import Foundation

let n = Int(readLine()!)!
var events = [(angle: Double, inOut: Int, index: Int)]()
var maxLowerRadius = -1.0
var minUpperRadius = 1000000.0

for i in 0..<n {
    let input = readLine()!.components(separatedBy: " ")
    let rect = input.compactMap { Double($0) }
    maxLowerRadius = max(rect[0],maxLowerRadius)
    minUpperRadius = min(rect[1], minUpperRadius)
    events.append((angle: rect[2], inOut: 1, index: i))
    events.append((angle: rect[3], inOut: -1, index: i))
}

events.sort { $0.angle < $1.angle || ($0.angle == $1.angle && $0.inOut < $1.inOut) }

var recsIn = Set<Int>()

for i in 0..<(n*2) {
    if events[i].inOut == 1 {
        recsIn.insert(events[i].index)
    } else {
        recsIn.remove(events[i].index)
    }
}

var area = 0.0
for i in 0..<(n*2) {
    if events[i].inOut == 1 {
        recsIn.insert(events[i].index)
    } else {
        if recsIn.count == n {
            var angle = 0.0
            if i == 0 {
                angle = (2 * .pi) + events[i].angle - events.last!.angle
            } else {
                angle = events[i].angle - events[i-1].angle
            }
            area += (minUpperRadius*minUpperRadius - maxLowerRadius*maxLowerRadius) * angle / 2
        }
        recsIn.remove(events[i].index)
    }
}

print(area)
