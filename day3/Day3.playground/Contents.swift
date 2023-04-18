func distributeGifts(_ packOfGifts: [String], _ reindeers: [String]) -> Int {
  let reindeersWeightLim = reindeers.reduce(0, { $0 + $1.count * 2 })
  let packWeight = packOfGifts.reduce(0, { $0 + $1.count })
  
  return reindeersWeightLim / packWeight
}

let packOfGifts = ["book", "doll", "ball"]
let reindeers = ["dasher", "dancer"]

// pack weights 4 + 4 + 4 = 12
// reindeers can carry (2 * 6) + (2 * 6) = 24
print(distributeGifts(packOfGifts, reindeers)) // 2
