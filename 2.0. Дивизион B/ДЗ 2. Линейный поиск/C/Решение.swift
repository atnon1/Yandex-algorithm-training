import Foundation

let input = Array(readLine()!)
var cnt = 0
for i in 0..<input.count/2 {
    if input[i] != input[input.count - i - 1] {
        cnt += 1
    }
}
print(cnt)
