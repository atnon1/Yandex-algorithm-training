import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
if input[0] > 12 || input[1] > 12 || input[0] == input[1] {
    print("1")
} else {
    print("0")
}



