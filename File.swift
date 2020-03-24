import Foundation
import UIKit

class TheButton: UIButton {
    private lazy var timerView = TimerView()
    private lazy var timerState = TimerState()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            // since I already have an enum that handles state of the button wouldn't I want use that for the isHightlighted bool in UIButton?
        }
    }
    
    enum TimerState {
        case ready
        case running
        case stopped
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
      }
}
