import Foundation

let seq = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
var met = Set<String>()

for num in seq {
    if met.contains(num) {
        print("YES")
    } else {
        print("NO")
        met.insert(num)
    }
}
