import Foundation

var votes = [String:Int]()
while let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
  votes[input[0], default: 0] += Int(input[1])!
}

for candidate in votes.keys.sorted() {
  print(candidate, votes[candidate]!)
}
