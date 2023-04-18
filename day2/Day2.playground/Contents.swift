import Foundation

func countHours(_ year: Int, _ holidays: [String]) -> Int {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "MM/dd/yy"
  
  let hoursCount = holidays.reduce(0, { acc, holiday in
    guard
      let date = dateFormatter.date(from: "\(holiday)/\(year)"),
      let weekday = Calendar.current.dateComponents([.weekday], from: date).weekday
    else {
      return acc
    }
    if (weekday == 1 || weekday == 7) {
      return acc
    }
    return acc + 2
  })
  return hoursCount
}

let year = 2022
let holidays = ["01/06", "04/01", "12/25"]

print(countHours(year, holidays))
