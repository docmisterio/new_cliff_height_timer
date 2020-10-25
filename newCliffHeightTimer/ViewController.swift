import UIKit

class ViewController: UIViewController {
    private lazy var timerView = TimerView()
    private var activeTimer: Timer?
    private var timerState: TimerView.TimerState = .ready {
        didSet {
            timerView.setState(timerState)
        }
    }
    private let labelFormatter = LabelFormatter()
    var formattedDuration = 0.00
    
    override func loadView() {
        view = timerView
        timerView.setState(.ready)
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
            
            self.formattedDuration = duration
                        
            self.timerView.timerLabel.text = self.labelFormatter.format(duration)
        })
        
    }
    
    func stopTapped() {
        timerState = .stopped
        print("stop tapped")
        let duration = String(formattedDuration)
        
        self.timerView.feetLabel.text = "\(self.labelFormatter.durationInFeet(duration)) ft"
        self.timerView.meterLabel.text = "\(self.labelFormatter.durationInMeters(duration)) m"
        activeTimer?.invalidate()
    }
    
    func resetTapped() {
        timerState = .ready
        print("reset tapped")
        timerView.timerLabel.text = "0.00"
    }
}

