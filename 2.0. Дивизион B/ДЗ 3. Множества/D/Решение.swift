import Foundation

let max = Int(readLine()!)!
var possible = Set(1...max)

var question = readLine()!

while question != "HELP" {
  let answer = readLine()!
  let nums = question.components(separatedBy: " ").map { Int($0)! }
  if answer == "NO" {
    possible.subtract(nums)
  } else {
    possible.formIntersection(nums)
  }
  question = readLine()!
}
possible.sorted().forEach { print( $0, terminator: " ") }
