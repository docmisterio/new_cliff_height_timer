import Foundation

struct LabelFormatter {
    private let numberFormatter = NumberFormatter()
    
    func format(_ value: Double) -> String {
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: value)) else { return "Illegal Error. Don't do that." }
        return formattedNumber
    }
    
    func durationInFeet(_ duration: String) -> String {
        let myDuration = Double(duration)
        return format(myDuration! * myDuration! * 16)
    }
    
    func durationInMeters(_ duration: String) -> String {
        let myDuration = Double(duration)
        return format(myDuration! * myDuration! * 16 * 0.3)
    }
}

