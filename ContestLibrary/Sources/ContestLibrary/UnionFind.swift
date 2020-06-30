import Foundation

public struct UnionFind {
    private var parent: [Int] = []
    private var rank: [Int] = []
    
    init(_ N: Int) {
        for i in 0...N {
            parent.append(i)
            rank.append(0)
        }
    }
    
    public mutating func find(By x: Int) -> Int {
        var tmp = x
        while self.parent[tmp] != tmp {
            self.parent[tmp] = self.parent[self.parent[tmp]]
            tmp = self.parent[tmp]
        }
        return tmp
    }
    
    public mutating func union(_ x: Int, _ y: Int) -> Bool {
        var tmp_x = self.find(By: x)
        var tmp_y = self.find(By: y)
        if tmp_x == tmp_y {
            return false
        }
        if (rank[tmp_x] < rank[tmp_y]) {
            swap(&tmp_x, &tmp_y)
        }
        self.rank[tmp_x] += self.rank[tmp_y]
        self.parent[tmp_y] = tmp_x
        return true
    }
    
    public mutating func isSame(_ x: Int, _ y: Int) -> Bool {
        return self.find(By: x) == self.find(By: y)
    }
}