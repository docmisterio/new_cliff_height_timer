import UIKit

class MainViewController: UIViewController {
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
        timerView.installTitleConstraints()
        timerView.installLabelContainerConstraints()
        timerView.installButtonConstraints()
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
        let duration = String(formattedDuration)
        let feetLabel = timerView.feetLabel
        let meterLabel = timerView.meterLabel
        
        transition(the: feetLabel, to: "\(self.labelFormatter.durationInFeet(duration)) ft")
        transition(the: meterLabel, to: "\(self.labelFormatter.durationInMeters(duration)) m")
        
        activeTimer?.invalidate()
    }
    
    func resetTapped() {
        timerState = .ready
        timerView.timerLabel.text = "0.00"
    }
    
    func transition(the label: UILabel, to thisString: String) {
        let transition = CATransition()
        transition.duration = 0.2
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({ [] in
            label.text = thisString
            label.layer.add(transition, forKey: kCATransition)
        })
        CATransaction.commit()
    }
}

