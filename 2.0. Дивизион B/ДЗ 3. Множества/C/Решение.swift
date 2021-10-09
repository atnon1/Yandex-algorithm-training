import Foundation

let seq = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
var metOnce = [String:Bool]()

for num in seq {
  metOnce[num] = (metOnce[num] == nil ? true : false)
}

var ans = [String]()
for num in seq {
  if metOnce[num]! {
    ans.append(num)
  }
}
print(ans.joined(separator: " "))
