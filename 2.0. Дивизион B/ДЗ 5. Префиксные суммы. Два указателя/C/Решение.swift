import Foundation

func readIntArray() -> [Int] {
    readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int($0)! }
}

let cnts = readIntArray()
let groupCnts = ([0]+readIntArray()).enumerated().sorted(by: { $0.1 < $1.1 })
let computerCnts = ([0]+readIntArray()).enumerated().sorted(by: { $0.1 < $1.1 })

var groupsClass = [Int:Int]()
var groupsEquipedCnt = 0
var groupIndex = 1
var classIndex = 1

while classIndex <= cnts[1] && groupIndex <= cnts[0] {
    let group = groupCnts[groupIndex]
    let room = computerCnts[classIndex]
    if group.1 + 1 <= room.1 {
        groupsEquipedCnt += 1
        groupsClass[group.0] = room.0
        groupIndex += 1
    }
    classIndex += 1
}

print(groupsEquipedCnt)
for i in 1...cnts[0] {
    print((groupsClass[i] ?? 0), terminator: " ")
}
