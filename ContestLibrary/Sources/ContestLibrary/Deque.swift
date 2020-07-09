import Foundation

struct Deque<T> {
    private var items = Array<T?>(repeating: nil, count: 2048)
    private var frontIndex = 0
    private var backIndex = 0
    private var count = 0

    /* 終端に要素を追加する */
    mutating func pushBack(_ item: T) {
        // 領域不足
        if (items.count == count) {
            realloc()
        }
        // 終端の位置を後ろにずらして追加
        backIndex = indexClipping(backIndex + 1)
        items[backIndex] = item
        count += 1
    }

    /* 先端に要素を追加する */
    mutating func pushFront(_ item: T) {
        // 領域不足
        if (items.count == count) {
            realloc()
        }
        // 先端の位置を前にずらして追加
        frontIndex = indexClipping(frontIndex - 1)
        items[frontIndex] = item
        count += 1
    }

    /* 先端の要素を取り出す
     * 要素が１つでも入っているならば nil ではない */
    mutating func popFront() -> T? {
        let res = items[frontIndex]
        frontIndex = indexClipping(frontIndex + 1)
        count -= 1
        return res
    }

    /* 終端の要素を取り出す
     * 要素が１つでも入っているならば nil ではない */
    mutating func popBack() -> T? {
        let res = items[backIndex]
        backIndex = indexClipping(backIndex - 1)
        count -= 1
        return res
    }

    /* 先端の要素を調べる */
    func front() -> T? {
        return items[frontIndex]
    }

    /* 終端の要素を調べる */
    func back() -> T? {
        return items[backIndex]
    }

    mutating func realloc() {
        var newItems = Array<T?>(repeating: nil, count: count*2)
        for i in 0..<count {
            newItems[i] = items[frontIndex]
            frontIndex = indexClipping(frontIndex + 1)
        }
        frontIndex = 0
        backIndex = count - 1
        items = newItems
    }

    /* items.count % index を計算する */
    func indexClipping(_ index: Int) -> Int {
        return (index + items.count) & (items.count - 1)
    }
}