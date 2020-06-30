import Foundation

struct Heap<T: Comparable> {
    private var items = [T]()
    private let compare: (T, T) -> Bool
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    init(By: @escaping (T, T) -> Bool) {
        compare = By
    }
    
    mutating func push(_ item: T) {
        items.append(item)
        var now = items.endIndex - 1
        while now > 0 {
            let parent = (now - 1) / 2
            if compare(items[now], items[parent]) {
                items.swapAt(parent, now)
                now = parent
            } else {
                break
            }
        }
    }
    mutating func pop() -> T {
        let res = items.first!
        items[0] = items[items.endIndex - 1]
        items.removeLast()
        var now = 0
        while (2 * now + 1) < items.endIndex {
            var l = 2 * now + 1
            let r = 2 * now + 2
            if r < items.endIndex && compare(items[r], items[l]) {
                l = r
            }
            if compare(items[now], items[l]) {
                break
            }
            items.swapAt(now, l)
            now = l
        }
        return res
    }
    
    func print() -> Void {
        for i in items {
            Swift.print(i, terminator: " ")
        }
        Swift.print()
    }
}