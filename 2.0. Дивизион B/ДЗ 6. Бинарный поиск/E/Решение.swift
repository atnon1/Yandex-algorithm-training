import Foundation

func readIntArray() -> [Int] {
    readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int($0)! }
}

func lBinSearch(left: Int, right: Int, check: (Int)->Bool) -> Int {
    var l = left
    var r = right
    while l < r {
        let m = (l+r)/2
        if check(m) {
            r = m
        } else {
            l = m + 1
        }
    }
    return l
}

let input = readIntArray()
let n = input[0]
let k = input[1]
let points = readIntArray().sorted()

func allPointsCovered(withLength l: Int) -> Bool {
    var pointIndex = 0
    for _ in 0..<k {
        let coverTo = points[pointIndex] + l
        pointIndex = lBinSearch(left: pointIndex, right: points.count - 1) { points[$0] > coverTo }
        if points[pointIndex] <= coverTo {
            return true
        }
    }
    return false
}

let l = lBinSearch(left: 0, right: abs(points.last! - points.first!), check: allPointsCovered)
print(l)
