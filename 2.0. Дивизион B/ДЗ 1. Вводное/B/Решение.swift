import Foundation

let input = readLine()!.components(separatedBy: " ").map {Int($0)!}
let firstDirection = abs(input[1]-input[2])-1
let secondDirection = input[0] - abs(input[1]-input[2]) - 1
print(min(firstDirection, secondDirection))
