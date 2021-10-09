import Foundation

let n = Int(readLine()!)!

var names = Array(repeating: "", count: n+1)
var responseNum = Array(repeating: 0, count: n+1)
var newCnt = Array(repeating: 0, count: n+1)

for k in 1...n {
    let originNum = Int(readLine()!)!
    if originNum == 0 {
        let name = readLine()!
        names[k] = name
        responseNum[k] = k
    } else {
        responseNum[k] = responseNum[originNum]
    }
    _ = readLine()
}

var maxCnt = 0
var maxI = 0
for i in 1...n {
    let responseI = responseNum[i]
    newCnt[responseI] += 1
    let newValue = newCnt[responseI]
    if maxCnt <= newValue {
        if maxCnt < newValue || responseI<maxI {
            maxI = responseI
        }
        maxCnt = newValue
    }
}

print( names[maxI] )
