import Foundation

func fBinSearch(left: Double, right: Double, eps: Double, check: (Double)->Bool) -> Double {
    var l = left
    var r = right
    while l+eps < r {
        let m = (l+r)/2
        if check(m) {
            r = m
        } else {
            l = m
        }
    }
    return l
}

let eps = 0.000001
let coefs = readLine()!.trimmingCharacters(in: .whitespaces)
    .components(separatedBy: " ").map { Double($0)! }

func isRootOfCubicEquation(x: Double, a: Double, b: Double, c: Double, d: Double) -> Bool {
    return (a > 0 ? a*x*x*x + b*x*x + c*x + d >= 0 : a*x*x*x + b*x*x + c*x + d <= 0)
}

func isRootOfTheProblem(x: Double) -> Bool {
    isRootOfCubicEquation(x: x, a: coefs[0], b: coefs[1], c: coefs[2], d: coefs[3])
}

let x = fBinSearch(left: -1000000000, right: 1000000000, eps: eps, check: isRootOfTheProblem)

print(x)

