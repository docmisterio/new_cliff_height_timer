import UIKit

class ViewController: UIViewController {
    private lazy var timerView = TimerView()
    private var activeTimer: Timer?
    private var timerState: TimerState = .ready
    private let labelFormatter = LabelFormatter()
    
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
            let duration = currentDate.timeIntervalSince(startDate)
            
            let formattedDuration = self.labelFormatter.format(duration)
            
            self.timerView.timerLabel.text = formattedDuration
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

class Thing: UIButton {
    override var isHighlighted: Bool {
        didSet {
            // doStuff
        }
    }
}
