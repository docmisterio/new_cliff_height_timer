import UIKit

class ViewController: UIViewController {
    private lazy var timerView = TimerView()
    private var activeTimer: Timer?
    private var timerState: TimerState = .ready
    private let labelFormatter = LabelFormatter()
    private let feetFormatter = LabelFormatter(1)
    private var duration = 0.0
    
    enum TimerState {
        case ready
        case running
        case stopped
    }
    
    override func loadView() {
        view = timerView
        timerView.installContraints()
        timerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        switch timerState {
        case .ready:
            startTapped()
        case .running:
            stopTapped()
        case .stopped:
             resetTapped()
        }
    }
    
    func startTapped() {
        timerState = .running
        print("start tapped")
        activeTimer?.invalidate()
        
        let startDate = Date()
        activeTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            let currentDate = Date()
            self.duration = currentDate.timeIntervalSince(startDate)
            
            self.timerView.timerLabel.text = self.labelFormatter.format(self.duration)
        })
        timerView.actionButton.setTitle("STOP", for: .normal)
        timerView.actionButton.setTitleColor(.white, for: .normal)
        timerView.actionButton.backgroundColor = .red
    }
    
    func stopTapped() {
        timerState = .stopped
        print("stop tapped")
        activeTimer?.invalidate()
        
        timerView.actionButton.setTitle("RESET", for: .normal)
        timerView.actionButton.setTitleColor(.black, for: .normal)
        timerView.actionButton.backgroundColor = .white
        
        timerView.timerLabel.text = labelFormatter.durationInFeet(duration)
    }
    
    func resetTapped() {
        timerState = .ready
        print("reset tapped")
        
        timerView.actionButton.backgroundColor = .white
        timerView.actionButton.setTitle("START", for: .normal)
        timerView.actionButton.setTitleColor(.blue, for: .normal)
        timerView.timerLabel.text = "0.00"
    }
}

// pad the button
// make the button press / buttonSubClass
// organize the files / functions
// add math labels for meter and feet, readjust the timer label up

class TheButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            // since I already have an enum that handles state of the button wouldn't I want use that for the isHightlighted bool in UIButton?
        }
    }
}
