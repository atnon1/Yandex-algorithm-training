import Foundation

struct SegmentPoint: Comparable {
    enum PointType: Int {
        case start
        case end
    }
    
    let point: Int
    let type: PointType
    let segmentStartPoint: Int
    let initialIndex: Int
    
    static func < (lhs: SegmentPoint, rhs: SegmentPoint) -> Bool {
        lhs.point < rhs.point || (lhs.point == rhs.point && lhs.type.rawValue < rhs.type.rawValue)
    }
    static func == (lhs: SegmentPoint, rhs: SegmentPoint) -> Bool {
        lhs.point == rhs.point && lhs.type == rhs.type
    }
}

func readIntArray()->[Int] {
    readLine()!.components(separatedBy: " ").map { Int($0)! }
}

let nums = readIntArray()
let kittiesPoints = readIntArray().sorted()
var segmentPoints = [SegmentPoint]()

for i in 0..<nums[1] {
    let segment = readIntArray()
    segmentPoints.append(SegmentPoint(point: segment[0], type: .start, segmentStartPoint: segment[0], initialIndex: i))
    segmentPoints.append(SegmentPoint(point: segment[1], type: .end, segmentStartPoint: segment[0], initialIndex: i))
}

segmentPoints.sort()
var kittiesToSegmentPoints = [Int:Int]()
var segments = Array(repeating: 0, count: nums[1])

var kittyIndex = 0
var currentKittiesCnt = 0

for point in segmentPoints {
    while kittyIndex < nums[0] && kittiesPoints[kittyIndex] < point.point {
        currentKittiesCnt += 1
        kittyIndex += 1
    }
    if kittiesToSegmentPoints[point.point] == nil {
        kittiesToSegmentPoints[point.point] = currentKittiesCnt
    }
    if point.type == .end {
        while kittyIndex < nums[0] && kittiesPoints[kittyIndex] == point.point {
            currentKittiesCnt += 1
            kittyIndex += 1
        }
        kittiesToSegmentPoints[point.point+1] = currentKittiesCnt
        segments[point.initialIndex] = kittiesToSegmentPoints[point.point+1]! - kittiesToSegmentPoints[point.segmentStartPoint]!
    }
}

print(segments.map{ String($0) }.joined(separator: " "))
