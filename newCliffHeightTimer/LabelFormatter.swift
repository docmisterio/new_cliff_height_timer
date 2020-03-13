import Foundation

struct LabelFormatter {
    private let numberFormatter = NumberFormatter()
    init() {}
    
    func format(_ value: Double) -> String {
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        let formattedNumber = numberFormatter.string(from: NSNumber(value: value))

        return formattedNumber ?? ""
        // look up nil coelessing
    }
}
