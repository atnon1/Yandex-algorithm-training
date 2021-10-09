import Foundation

let n = Int(readLine()!)!
var colorSums = [Int:Int]()

for _ in 0..<n {
  let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
  colorSums[input[0], default: 0] += input[1]
}

for color in colorSums.keys.sorted() {
  print(color, colorSums[color]!)
}
