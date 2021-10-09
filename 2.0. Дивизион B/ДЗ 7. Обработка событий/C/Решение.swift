import Foundation

func readIntArray() -> [Int] {
readLine()!
    .components(separatedBy: " ").compactMap { Int($0) }
}

let m = Int(readLine()!)!
var input = readIntArray()
var segments = [(start: Int, end: Int)]()

while input != [0, 0] {
    if input[1] > 0 && input[0] < m {
        segments.append((input[0], input[1]))
    }
    input = readIntArray()
}

segments.sort { $0.start < $1.start }

var nowRight = 0
var maxSegment = (start: 0, end: 0)
var coveringSegments = [(start: Int, end: Int)]()

for segment in segments {
    if segment.start > nowRight {
     coveringSegments.append(maxSegment)
        nowRight = maxSegment.end
        if nowRight < segment.start {
            break
        }
    }
    if maxSegment.end < segment.end {
        maxSegment = segment
    }
}

if nowRight < m {
    coveringSegments.append(maxSegment)
    nowRight = maxSegment.end
}

if nowRight >= m {
    print(coveringSegments.count)
    for segment in coveringSegments {
        print(segment.start, segment.end)
    }
} else {
    print("No solution")
}

