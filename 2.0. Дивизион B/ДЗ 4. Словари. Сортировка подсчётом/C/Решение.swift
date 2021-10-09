import Foundation

var wordCounts = [String:Int]()

while let input = readLine() {
    for word in input.components(separatedBy: .whitespacesAndNewlines) {
        wordCounts[word, default: 0] += 1
    }
}

for pair in wordCounts.sorted(by: { $0.value > $1.value || $0.value == $1.value && $0.key < $1.key }) {
    print(pair.key)
}

