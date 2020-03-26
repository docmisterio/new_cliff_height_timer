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
               
               let formattedDuration = self.labelFormatter.format(duration)
               
               self.timerView.timerLabel.text = formattedDuration
           })
           
       }
       
       func stopTapped() {
           timerState = .stopped
           print("stop tapped")
           activeTimer?.invalidate()
       }
       
       func resetTapped() {
           timerState = .ready
           print("reset tapped")
           timerView.timerLabel.text = "0.00"
       }
}

// pad the button
// make button same size no matter what state it's in
// add math labels for meter and feet, readjust the timer label up


