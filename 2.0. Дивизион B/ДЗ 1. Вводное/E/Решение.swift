import Foundation

let d = Double(readLine()!)!
let coor = readLine()!.components(separatedBy: " ").map { Double($0)! }
let x = coor[0]
let y = coor[1]
if x >= 0 && y >= 0 && (x + y) <= d {
    print(0)
} else {
    let distA = x*x+y*y
    let distB = (x-d)*(x-d)+(y*y)
    let distC = (x*x)+(y-d)*(y-d)
    if distA <= distB && distA <= distC {
        print(1)
    } else if distB <= distC {
        print(2)
    } else {
        print(3)
    }
} 
