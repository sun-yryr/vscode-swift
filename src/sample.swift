//
//  main.swift
//
//  Created by sun-yryr
//  Copyright © 2019 sun-yryr. All rights reserved.
//

import Foundation

prefix operator *
prefix func * <T> (a: [T]) -> (T, T) {return (a[0], a[1])}
prefix func * <T> (a: [T]) -> (T, T, T) {return (a[0], a[1], a[2])}


func readInt(separator s: Character = " ") -> [Int] {return readLine()!.split(separator: s).map({Int($0)!})}
func readDouble(separator s: Character = " ") -> [Double] {return readLine()!.split(separator: s).map({Double($0)!})}
func readElement(separator s: Character = " ") -> [String] {return readLine()!.split(separator: s).map({String($0)})}

extension String {
    func at(_ i: Int) -> Character {
        precondition(0 <= i && i < self.count)
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

func main() {
    let N = Int(readLine()!)!
}
main()
