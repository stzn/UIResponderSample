import Foundation

private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = NSTimeZone.system
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

extension Date {

    func string(format: String = "yyyy/MM/dd") -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    init?(dateString: String, dateFormat: String = "yyyy/MM/dd") {
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }

}

extension String {
    func convertDateFormat(from: String, to: String) -> String {
        
        guard let date = Date(dateString: self, dateFormat: from) else {
            return ""
        }
        return date.string(format: to)
    }
}
