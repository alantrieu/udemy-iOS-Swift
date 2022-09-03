import Foundation

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        return Int((width * height / 1.5).rounded(.up))
    }
    
    set {
        print("This amount of paint can cover \(Float(newValue) * 1.5) square metres")
    }
}

print(bucketsOfPaint)
