import Foundation

class TreeNode {
    var key: Int?
    var left: TreeNode?
    var right: TreeNode?

    init(key: Int) {
        self.key = key
    }

    init() {}

    @discardableResult func add(_ key: Int) -> Bool {
        if let nodeKey = self.key {
           if nodeKey == key {
                return false
           } else if key < nodeKey {
               if let leftNode = left {
                   return leftNode.add(key)
               } else {
                   let newNode = TreeNode(key: key)
                   left = newNode
                   return true
               }
           } else {
               if let rightNode = right {
                   return rightNode.add(key)
               } else {
                   let newNode = TreeNode(key: key)
                   right = newNode
                   return true
               }
            }
        } else {
            self.key = key
            return true
        }
        return false
    }

    func contains(_ key: Int) -> Bool {
        if let nodeKey = self.key {
            if nodeKey == key {
                return true
            } else if key < nodeKey {
                if let leftNode = left {
                    return leftNode.contains(key)
                } else {
                    return false
                }
            } else {
                if let rightNode = right {
                    return rightNode.contains(key)
                } else {
                    return false
                }
            }
        }
        return false
    }

    func printTree(level: Int = 0) {
        if let leftNode = left {
            leftNode.printTree(level: level+1)
        }
        
        var stringToPrint = ""
        for _ in 0..<level {
            stringToPrint += "."
        }
        stringToPrint += (key != nil ? String(key!) : "")
        print(stringToPrint)
        
        if let rightNode = right {
            rightNode.printTree(level: level+1)
        }
    }
}

let root = TreeNode()

func operate(query: String) {
    let params = query.components(separatedBy: " ")
    switch params[0] {
    case "ADD":
        print(root.add(Int(params[1])!) ? "DONE" : "ALREADY")
    case "SEARCH":
        print(root.contains(Int(params[1])!) ? "YES" : "NO")
    case "PRINTTREE":
        root.printTree()
     default:
        break
    }
}

while let query = readLine() {
    operate(query: query)
} 
