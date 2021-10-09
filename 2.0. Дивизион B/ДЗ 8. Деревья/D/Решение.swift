import Foundation

let n = Int(readLine()!)!
var connections = [String: [String]]()

for _ in 0..<(n-1) {
    let pair = readLine()!.components(separatedBy: " ")
    connections[pair[0], default: [String]()].append(pair[1])
    connections[pair[1], default: [String]()].append(pair[0])
}

func longestTree(from node: String, parent: String? = nil) -> [String] {
    let currentConnections = connections[node]!
    if currentConnections.count == 1 && parent != nil {
        return [node]
    }
    var currentLongest = [String]()
    for connection in currentConnections {
        if connection == (parent ?? "") {
            continue
        }
        let newChain = longestTree(from: connection, parent: node)
        currentLongest = currentLongest.count < newChain.count ? newChain : currentLongest
    }
    return [node]+currentLongest
}

let firstD = longestTree(from: "1").last!
let ans = longestTree(from: firstD).count
print(ans)
