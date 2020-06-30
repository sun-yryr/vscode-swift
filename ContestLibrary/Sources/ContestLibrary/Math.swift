import Foundation

public func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a;
    var b = b;
    if a < b {
        swap(&a, &b)
    }
    while a % b != 0 {
        a %= b
        swap(&a, &b)
    }
    return b
}

public func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}