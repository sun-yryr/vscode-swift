import Foundation

struct Stack<T> {
    private var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    func size() -> Int {
        return items.count
    }
    func peek() -> T {
        return items.last!
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    subscript(i: Int) -> T? {
        if i<0 || items.count<=i {
            return nil
        }
        return items[i]
    }
}
