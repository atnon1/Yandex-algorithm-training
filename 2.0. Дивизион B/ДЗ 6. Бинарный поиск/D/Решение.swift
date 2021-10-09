import Foundation

func treesCount(onDay days: Int, cntPerDay: Int, dayOffOn dayOff: Int) -> Int {
    cntPerDay * (days - days/dayOff)
}

func lBinSearch(left: Int, right: Int, check: (Int)->Bool) -> Int {
    var l = left
    var r = right
    while l<r {
        let m = (l+r)/2
        if check(m) {
            r = m
        } else {
            l = m + 1
        }
    }
    return l
}

let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int($0)! }
let a = input[0]
let k = input[1]
let b = input[2]
let m = input[3]
let x = input[4]

let maxDays = x*2/(a+b)+2
let ans = lBinSearch(left: 0, right: maxDays) {  (treesCount(onDay: $0, cntPerDay: a, dayOffOn: k) + treesCount(onDay: $0, cntPerDay: b, dayOffOn: m)) >= x }
print(ans)
