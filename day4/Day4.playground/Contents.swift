struct Box: Comparable {
    let l: Int
    let w: Int
    let h: Int
    
    static func <(lhs: Box, rhs: Box) -> Bool {
        return lhs.l < rhs.l && lhs.w < rhs.w && lhs.h < rhs.h
    }
    
    static func ==(lhs: Box, rhs: Box) -> Bool {
        return lhs.l == rhs.l && lhs.w == rhs.w && lhs.h == rhs.h
    }
}

func fitsInOneBox(_ boxes: [Box]) -> Bool {
    let sortedBoxes = boxes.sorted()
    for i in 0..<sortedBoxes.count - 1 {
        let smallBox = sortedBoxes[i]
        let bigBox = sortedBoxes[i + 1]
        if smallBox.l >= bigBox.l || smallBox.w >= bigBox.w || smallBox.h >= bigBox.h {
            return false
        }
    }
    return true
}

let boxes = [
    Box(l: 1, w: 1, h: 1),
    Box(l: 3, w: 3, h: 3),
    Box(l: 2, w: 2, h: 2),
]

print(fitsInOneBox(boxes)) // true
