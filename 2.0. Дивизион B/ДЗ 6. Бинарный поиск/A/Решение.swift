import Foundation

func lBinSearch(left: Int, right: Int, check: (Int)->Bool) -> Int {
    var l = left
    var r = right
    while l < r {
        let m = (l+r)/2
        if check(m) {
            r = m
        } else {
            l = m+1
        }
    }
    return l
}

let n = Int(readLine()!)!
let seq = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

for _ in 0..<Int(readLine()!)! {
    let bounds = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let left = lBinSearch(left: 0, right: n-1) { seq[$0] >= bounds[0] }
    let right = lBinSearch(left: 0, right: n-1) { seq[$0] > bounds[1] }
    if seq[left] < bounds[0] || seq[left] > bounds[1] {
        print(0, terminator: " ")
    } else {
        print( right + (seq[right] > bounds[1] ? 0 : 1) - left, terminator: " " )
    }
}
