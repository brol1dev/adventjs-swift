
func wrapping(_ gifts: [String]) -> [String] {
  let wrapped = gifts.map { gift -> String in
    let paperSize = String.init(repeating: "*", count: gift.count + 2)
    return "\(paperSize)\n*\(gift)*\n\(paperSize)"
  }
  return wrapped
}

let gifts = ["cat", "game", "socks"]
let wrapped = wrapping(gifts)
print(wrapped)
