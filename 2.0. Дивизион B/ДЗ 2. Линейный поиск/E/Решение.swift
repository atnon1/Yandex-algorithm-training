import Foundation

let _ = readLine()!
let diplomaCnt = readLine()!.components(separatedBy: " ")
let diplomaCheckTime = 1
var maxFolderCheckTime = 0
var checkTime = 0
for cnt in diplomaCnt {
    let folderCheckTime = Int(cnt)! * diplomaCheckTime
    checkTime += folderCheckTime
    if folderCheckTime > maxFolderCheckTime {
        maxFolderCheckTime = folderCheckTime
    }
}
print(checkTime - maxFolderCheckTime)
