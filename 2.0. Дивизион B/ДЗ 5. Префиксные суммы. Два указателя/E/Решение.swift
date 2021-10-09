import Foundation

extension Array {
    func removingFirst() -> Self {
        var array = self
        array.removeFirst()
        return array
    }
}

func readIntArray() -> [Int] {
    readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int($0)! }
}

let tupleSort: ((Int,Int), (Int, Int)) -> Bool =
    { $0.1 < $1.1 || $0.1 == $1.1 && $0.0 < $1.0 }

let numToFind = readIntArray()[0]
let firstSeq = readIntArray().removingFirst()
let secondSeq = readIntArray().removingFirst().enumerated().sorted(by: tupleSort)
let thirdSeq = readIntArray().removingFirst().enumerated().sorted(by: tupleSort)
    
func findIndicesForSum() -> (Int, Int, Int)? {
    
    var ans: (i: Int, j: Int, k: Int)? = nil
    var i = 0
    
    while i < firstSeq.count && ans == nil {
        let leftToFind = numToFind - firstSeq[i]
        var j = 0
        var k = (thirdSeq.firstIndex(where: { $0.element >= leftToFind}) ?? thirdSeq.count) - 1
        while k >= 0 && j < secondSeq.count {
            let currentSum = secondSeq[j].element + thirdSeq[k].element
            if currentSum < leftToFind {
                j += 1
            } else if currentSum > leftToFind {
                k -= 1
            } else {
                if let currentAns = ans {
                    if secondSeq[j].offset < currentAns.j || secondSeq[j].offset == currentAns.j && thirdSeq[k].offset < currentAns.k {
                        ans = (i, secondSeq[j].offset, thirdSeq[k].offset)
                    }
                } else {
                    ans = (i, secondSeq[j].offset, thirdSeq[k].offset)
                }
                k-=1
            }
        }
        i += 1
    }
    return ans
}

if let ans = findIndicesForSum() {
    print(ans.0, ans.1, ans.2)
} else {
    print(-1)
}

