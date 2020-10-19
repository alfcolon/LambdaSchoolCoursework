import UIKit

let startTime = CFAbsoluteTimeGetCurrent()

DispatchQueue.global().async {
    var x = 0
    for i in 1...100000 {
        x += i
    }
}


var y = 0
for i in 1...100000 {
    y += i
}

let endTime = CFAbsoluteTimeGetCurrent() - startTime
print(endTime)
