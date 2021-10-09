var current = Int(readLine()!)!
var cnt = 0
var max = current
while current != 0 {
    if current == max {
        cnt += 1
    }
    if current > max {
        max = current
        cnt = 1
    }
    current = Int(readLine()!)!
}
print(cnt)
