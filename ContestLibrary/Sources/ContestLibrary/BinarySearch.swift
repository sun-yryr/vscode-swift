import Foundation

extension Array where Element: Comparable {
    func binarySearch(key: Element) -> Bool {
        var Left = -1
        var Right = self.count
        while abs(Right - Left) > 1 {
            let mid = Left + (Right - Left) / 2
            if key == self[mid] {
                return true
            } else if key < self[mid] {
                Right = mid
            } else {
                Left = mid
            }
        }
        return false
    }
    
    
    /// key以上の値の中で最小のindexを返す
    ///
    /// - Parameter key: 探索対象
    /// - Returns: key <= self[index] となる最小のindex
    func lowerBound(key: Element) -> Index {
        var Left = -1
        var Right = self.count
        while abs(Right - Left) > 1 {
            let mid = Left + (Right - Left) / 2
            if key <= self[mid] {
                Right = mid
            } else {
                Left = mid
            }
        }
        return Right
    }
    
    /// key以下の値の中で最大のindexを返す
    ///
    /// - Parameter key: 探索対象
    /// - Returns: key >= self[index] となる最大のindex
    func upperBound(key: Element) -> Index {
        var Left = -1
        var Right = self.count
        while abs(Right - Left) > 1 {
            let mid = Left + (Right - Left) / 2
            if self[mid] <= key {
                Left = mid
            } else {
                Right = mid
            }
        }
        return Left
    }
}