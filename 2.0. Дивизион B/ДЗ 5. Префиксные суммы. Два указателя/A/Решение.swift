import Foundation

var file = try! String(contentsOfFile: "input.txt", encoding: .utf8).components(separatedBy: .whitespacesAndNewlines).filter { $0 != ""}.map { Int($0)! }
var prefixSum = [0]

for i in 2..<file[0]+2 {
    prefixSum.append(prefixSum[i-2] + file[i])
}

let j = 2+file[0]
for i in 0..<file[1] {
    print( prefixSum[file[j+i*2+1]]-prefixSum[file[j+i*2]-1] )
}
