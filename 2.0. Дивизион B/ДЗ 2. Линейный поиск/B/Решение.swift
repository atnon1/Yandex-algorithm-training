import Foundation

let street = readLine()!.components(separatedBy: " ")
var didMeetShop = false
var lastShopPosition = -1
var distance = [Int:Int]()
for index in street.indices {
    if street[index] == "2" {
        didMeetShop = true
        lastShopPosition = index
    }
    if street[index] == "1" && didMeetShop {
        distance[index] = index - lastShopPosition
    }
}
didMeetShop = false
for index in street.indices.reversed() {
    if street[index] == "2" {
        didMeetShop = true
        lastShopPosition = index
    }
    if street[index] == "1" && didMeetShop {
        distance[index] = min(lastShopPosition - index, distance[index, default: street.count])
    }
}
print(distance.values.max()!)
