import Foundation

var parents = [String: String]()

let n = Int(readLine()!)!
for _ in 0..<(n-1) {
    let input = readLine()!.components(separatedBy: " ")
    parents[input[0]] = input[1]
}

while let input = readLine()?.components(separatedBy: " ") {
    var firstAncestors = Set<String>()
    var relative: String? = input[0]
    while let ancestor = relative {
        firstAncestors.insert(ancestor)
        relative = parents[ancestor]
    }
    var secondRelative = input[1]
    while !firstAncestors.contains(secondRelative) {
        secondRelative = parents[secondRelative]!
    }
    print(secondRelative)
} 
