import Foundation

class TheButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            // since I already have an enum that handles state of the button wouldn't I want use that for the isHightlighted bool in UIButton?
        }
    }
}
