import UIKit

class ViewController: UIViewController {
    private lazy var timerView = TimerView()
    private lazy var button = TheButton()
    private var activeTimer: Timer?
    private var timerState: TimerState = .ready
    private let labelFormatter = LabelFormatter()
    
    override func loadView() {
        view = timerView
        timerView.installContraints()
        timerView.actionButton.addTarget(self, action: #selector(button.buttonTapped), for: .touchUpInside)
    }
}

// pad the button
// make button same size no matter what state it's in
// make the button press / buttonSubClass
// organize the files / functions
// add math labels for meter and feet, readjust the timer label up


