import Foundation

let length = readLine()!.components(separatedBy: " ").map({Int($0)!})[0]
let legs = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ").map { Int($0)! }
for (index, leg) in legs.enumerated() {
    if leg == (length-1)/2 && length%2 == 1 {
        print(leg)
        break
    }
    if leg > (length-1)/2 {
        print(legs[index-1], legs[index])
        break
    }
}



