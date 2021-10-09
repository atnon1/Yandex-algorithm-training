import Foundation

class TreeNode {
    enum Location {
        case root
        case left
        case right
    }
    var left: TreeNode?
    var right: TreeNode?
    let parent: TreeNode?
    let location: Location
    
     init(location: Location = .root, parent: TreeNode? = nil) {
        self.location = location
        self.parent = parent
    }
}

let n = Int(readLine()!)!

for _ in 0..<n {
    var node = TreeNode()
    var currentCode = [String]()
    var codes = [String]()
    for letter in readLine()! {
        if letter == "D" {
            node.left = TreeNode(location: .left, parent: node)
            node = node.left!
            currentCode.append("0")
        } else {
            codes.append(currentCode.joined())
            while node.location == .right {
                node = node.parent!
                currentCode.removeLast()
            }
            if node.location == .left {
                node = node.parent!
                currentCode.removeLast()
                
                node.right = TreeNode(location: .right, parent: node)
                node = node.right!
                currentCode.append("1")
            }
        }
    }
    codes.append(currentCode.joined())
    print(codes.count)
    for code in codes {
        print(code)
    }
}
