import Foundation

let seq = Array(readLine()!)
var openBracketCnt = 0
var isCorrect = true

for bracket in seq {
    if bracket == "(" {
        openBracketCnt  += 1
    }
    if bracket == ")" {
        openBracketCnt -= 1
    }
    if openBracketCnt < 0 {
        isCorrect = false
        break
    }
}
if openBracketCnt != 0 {
    isCorrect = false
}

print( isCorrect ? "YES" : "NO")
