import Foundation

func lBinSearch(left: Int, right: Int, check: (Int) -> Bool) -> Int {
    var l = left
    var r = right
    while l<r {
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
let seq = readLine()!.components(separatedBy: " ").map { Int($0)! }
let qn = Int(readLine()!)!
let qSeq = readLine()!.components(separatedBy: " ").map { Int($0)! }

for num in qSeq {
    let left = lBinSearch(left: 0, right: n-1) { seq[$0] >= num }
    let right = lBinSearch(left: 0, right: n-1) { seq[$0] > num }
    if seq[left] == num {
        print(left+1, right + (seq[right] > num ? 0 : 1))
    } else {
        print(0, 0)
    }
}
