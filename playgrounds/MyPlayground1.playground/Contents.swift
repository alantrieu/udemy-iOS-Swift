import UIKit

var fibArray: [Int] = []

var n = 10

var num1 = 0
var num2 = 1

fibArray.append(num1)
if n == 1 {
    print(fibArray)
}

fibArray.append(num2)
if n == 2 {
    print(fibArray)
}

var count = 2
while (count < n) {
    let result = num1 + num2
    fibArray.append(result)
    num1 = num2
    num2 = result
    
    count += 1
    
    if (count == n) {
        print(fibArray)
        break
    }
}
