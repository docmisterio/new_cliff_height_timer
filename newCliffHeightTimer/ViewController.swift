import UIKit

class ViewController: UIViewController {
    private lazy var timerView = TimerView()
    private var activeTimer: Timer?
    private var buttonTaps = 0
    
    
    override func loadView() {
        view = timerView
        timerView.installContraints()
        timerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if buttonTaps == 0 {
            startTapped()
        } else if buttonTaps == 1 {
            stopTapped()
        } else {
            resetTapped()
        }
    }
    
    func startTapped() {
        buttonTaps += 1
        print("start tapped")
        activeTimer?.invalidate()
        
        let startDate = Date()
        activeTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            let currentDate = Date()
            let duration = currentDate.timeIntervalSince(startDate)
            
            func formatDuration(DoubleDuration: (Double) -> String) {
                // make number formatter function to format the TimeInterval Double into a String?
            }
            
            self.timerView.timerLabel.text = "\(duration)"
        })
        timerView.actionButton.setTitle("STOP", for: .normal)
        timerView.actionButton.setTitleColor(.white, for: .normal)
        timerView.actionButton.backgroundColor = .red
    }
    
    func stopTapped() {
        print("stop tapped")
        activeTimer?.invalidate()
        buttonTaps += 1
        
        timerView.actionButton.setTitle("RESET", for: .normal)
        timerView.actionButton.setTitleColor(.black, for: .normal)
        timerView.actionButton.backgroundColor = .white
    }
    
    func resetTapped() {
        print("reset tapped")
        buttonTaps = 0
        
        timerView.actionButton.backgroundColor = .white
        timerView.actionButton.setTitle("START", for: .normal)
        timerView.actionButton.setTitleColor(.blue, for: .normal)
        timerView.timerLabel.text = "0.00"
    }
}


class TimerView: UIView {
    let titleLabel = UILabel()
    let timerLabel = UILabel()
    let actionButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(timerLabel)
        addSubview(actionButton)
        
        titleLabel.text = "Cliff Height Timer"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        timerLabel.text = "0.00"
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        
        actionButton.backgroundColor = .white
        actionButton.layer.cornerRadius = 5.0
        actionButton.setTitle("START", for: .normal)
        actionButton.setTitleColor(.blue, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installContraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTop = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 10)
        let titleLeading = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let titleTrailing = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let timerTop = NSLayoutConstraint(item: timerLabel, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        let timerLeading = NSLayoutConstraint(item: timerLabel, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let timerTrailing = NSLayoutConstraint(item: timerLabel, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonBottom = NSLayoutConstraint(item: actionButton, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 10)
        let buttonLeading = NSLayoutConstraint(item: actionButton, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let buttonTrailing = NSLayoutConstraint(item: actionButton, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        
        NSLayoutConstraint.activate([titleTop, titleLeading, titleTrailing, timerTop, timerLeading, timerTrailing, buttonBottom, buttonLeading, buttonTrailing])
    }
}
