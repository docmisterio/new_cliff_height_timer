import Foundation

class LabelFormatter : NSObject {
    private let numberFormatter = NumberFormatter()
    
    override init() {
        super.init()
        initialize(2)
    }
    
    init(_ fractions : Int) {
        super.init()
        initialize(fractions)
    }
    
    private func initialize(_ fractions : Int) {
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = fractions
        numberFormatter.maximumFractionDigits = fractions
    }
    
    func format(_ value: Double) -> String {
        let formattedNumber = numberFormatter.string(from: NSNumber(value: value))

        return formattedNumber ?? ""
        // look up nil coelessing
    }
    
    func durationInFeet(_ duration: String) -> String {
        let myDuration = Double(duration)
        return format(myDuration! * myDuration! * 16)
    }
}
