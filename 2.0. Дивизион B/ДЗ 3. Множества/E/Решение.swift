import Foundation

func readAndTrim()->String {
    return readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
}

let witCnt = Int(readAndTrim())!
var witTestimonies = [Set<Character>]()

for _ in 0..<witCnt {
    witTestimonies.append(Set(readAndTrim()))
}

let plateCnt = Int(readAndTrim())!
var plates = [(plate: String, cnt: Int)]()
var bestCnt = 0

for _ in 0..<plateCnt {
    let plate = readAndTrim()
    let plateLetters = Set(plate)
    var cnt = 0
    for testimony in witTestimonies {
        if plateLetters.isSuperset(of: testimony) {
            cnt += 1
        }
    }
    plates.append((plate, cnt))
    bestCnt = max(cnt, bestCnt)
}

for plate in plates {
    if plate.cnt == bestCnt {
        print(plate.plate)
    }
}

