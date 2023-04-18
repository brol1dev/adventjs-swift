func getMaxGifts(_ giftsCities: [Int],
                 _ maxGifts: Int,
                 _ maxCities: Int) -> Int {
  var memo = Array(repeating:
                    Array(repeating: 0, count: maxGifts + 1),
                   count: maxCities + 1)
  
  
  for city in 0..<giftsCities.count {
    for visited in (1...min(city + 1, maxCities)).reversed() {
      for giftsLeft in
            stride(from: maxGifts, through: giftsCities[city], by: -1) {
        memo[visited][giftsLeft] = max(
          memo[visited][giftsLeft],
          memo[visited - 1][giftsLeft - giftsCities[city]] + giftsCities[city]
        )
      }
    }
  }
  
  var maxGiftsResult = 0
  for visited in 1...maxCities {
    maxGiftsResult = max(maxGiftsResult, memo[visited][maxGifts])
  }
  
  return maxGiftsResult
}

let giftsCities = [12, 3, 11, 5, 7]
let maxGifts = 20
let maxCities = 3

// the highest sum of gifts to distribute
// visiting a maximum of 3 cities
// is 20: [12, 3, 5]

// the highest sum would be [12, 7, 11]
// but it exceeds the limit of 20 gifts and he
// would have to leave a city half-way.

print(getMaxGifts([12, 3, 11, 5, 7], 20, 3)); // 20
print(getMaxGifts([50], 15, 1)); // 0
print(getMaxGifts([50], 100, 1)); // 50
print(getMaxGifts([50, 70], 100, 1)); // 70
print(getMaxGifts([50, 70, 30], 100, 2)); // 100
print(getMaxGifts([50, 70, 30], 100, 3)); // 100
print(getMaxGifts([50, 70, 30], 100, 4)); // 100
