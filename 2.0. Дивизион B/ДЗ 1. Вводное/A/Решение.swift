let r = Int(readLine()!)!
let i = Int(readLine()!)!
let c = Int(readLine()!)!
var ans = 0
switch i {
    case 0:
        ans = (r == 0 ? c : 3)
    case 1:
        ans = c
    case 4:
        ans = (r == 0 ? 4 : 3)
    case 6:
        ans = 0
    case 7:
        ans = 1
    default:
        ans = i
}
print(ans)
