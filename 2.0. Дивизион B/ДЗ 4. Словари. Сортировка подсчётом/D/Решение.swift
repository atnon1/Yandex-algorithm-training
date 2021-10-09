import Foundation

let chairsTotal = 450.0
var parties = [String]()
var votes = [String:Double]()
var chairs = [String:Double]()
var reminders = [String:Double]()

while var input = readLine()?.components(separatedBy: " ") {
    let voteCnt = Double(input.removeLast())!
    let party = input.joined(separator: " ")
    votes[party] = voteCnt
    parties.append(party)
}

var denominator = votes.values.reduce(0, +) / chairsTotal

for party in parties {
    chairs[party] = (votes[party]!/denominator).rounded(.towardZero)
    reminders[party] = ((votes[party]!/denominator).truncatingRemainder(dividingBy: 1))
}

var chairsTaken = chairs.values.reduce(0, +)

if chairsTaken < chairsTotal {
    for pair in reminders.sorted(by: {
        $0.value > $1.value || $0.value == $1.value && votes[$0.key]! > votes[$1.key]!
        }) {
       if chairsTaken == chairsTotal {
           break
       }
       chairs[pair.key]! += 1
       chairsTaken += 1
    }
}

for party in parties {
    print((party), Int(chairs[party]!))
}
