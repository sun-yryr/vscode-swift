import Foundation

struct Queue<T> {
    private var items = [T]()
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    mutating func dequeue() -> T {
        return items.removeFirst()
    }
    func size() -> Int {
        return items.count
    }
    func head() -> T {
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
