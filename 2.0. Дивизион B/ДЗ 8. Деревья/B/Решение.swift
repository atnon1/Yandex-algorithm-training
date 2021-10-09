import Foundation

var childParent = [String: String]()

let n = Int(readLine()!)!
for _ in 0..<(n-1) {
    let input = readLine()!.components(separatedBy: " ")
    childParent[input[0]] = input[1]
}

while let input = readLine()?.components(separatedBy: " ") {
    var isFound = false
    var relative = childParent[input[1]]
    while let parent = relative {
        if parent == input[0] {
            print(1, terminator: " ")
            isFound = true
            break
        } else {
            relative = childParent[parent]
        }
    }
    if !isFound {
        relative = childParent[input[0]]
        while let parent = relative {
            if parent == input[1] {
                print(2, terminator: " ")
                isFound = true
                break
            } else {
                relative = childParent[parent]
            }
        }
    }
    if !isFound {
         print(0, terminator: " ")
    }
} 
