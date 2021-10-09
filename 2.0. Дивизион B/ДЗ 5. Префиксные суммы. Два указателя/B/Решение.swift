import Foundation

func readAndTrim() -> String {
    readLine()!.trimmingCharacters(in: .whitespaces)
}

let n = Int(readAndTrim())!
let seq = readAndTrim().components(separatedBy: " ").map { Int($0)! }

var prefixSum = [0]

for i in 0..<n {
    let sum = seq[i] + (prefixSum[i] < 0 ? 0 : prefixSum[i])
    prefixSum.append(sum)
}

print(prefixSum[1...].max()!)
