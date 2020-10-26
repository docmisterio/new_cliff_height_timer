import UIKit

class TimerView: UIView {
    enum TimerState {
        case ready, running, stopped
    }
    //declaring things this way makes me feel like I can think it through as I'm doing it.
    // don't REALLY understand the closure part of it.
    
    let titleLabel: UILabel = {
        let htLabel = UILabel()
        htLabel.text = "Cliff Height Timer"
        htLabel.textColor = .white
        htLabel.textAlignment = .center
        htLabel.font = htLabel.font.withSize(40)
        return htLabel
    }()
    let timerLabel: UILabel = {
        let mainTimerLabel = UILabel()
        mainTimerLabel.text = "0.00"
        mainTimerLabel.textColor = .white
        mainTimerLabel.textAlignment = .center
        mainTimerLabel.font = mainTimerLabel.font.withSize(60)
        return mainTimerLabel
    }()
    let actionButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.blue, for: .normal)
        return startButton
    }()
    let feetLabel: UILabel = {
        let ftLabel = UILabel()
        ftLabel.textColor = .white
        ftLabel.textAlignment = .center
        ftLabel.font = ftLabel.font.withSize(60)
        return ftLabel
    }()
    let meterLabel: UILabel = {
        let mtLabel = UILabel()
        mtLabel.textColor = .white
        mtLabel.textAlignment = .center
        mtLabel.font = mtLabel.font.withSize(60)
        return mtLabel
    }()
    let labelContainer: UIStackView

    override init(frame: CGRect) {
        self.labelContainer = UIStackView(arrangedSubviews: [timerLabel, feetLabel, meterLabel])
        labelContainer.axis = .vertical
        labelContainer.spacing = 75.0
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(labelContainer)
        addSubview(actionButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setState(_ state: TimerState) {
        switch state {
        case .ready:
            actionButton.setTitle("START", for: .normal)
            actionButton.setTitleColor(.white, for: .normal)
            actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 80)
            feetLabel.text = "0.00"
            meterLabel.text = "0.00"
            feetLabel.alpha = 0
            meterLabel.alpha = 0
        case .running:
            actionButton.setTitle("STOP", for: .normal)
            actionButton.setTitleColor(.red, for: .normal)
            actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 80)
            feetLabel.text = "0.00"
            meterLabel.text = "0.00"
            feetLabel.alpha = 0
            meterLabel.alpha = 0
        case .stopped:
            actionButton.setTitle("RESET", for: .normal)
            actionButton.setTitleColor(.white, for: .normal)
            actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 80)
            feetLabel.text = "0.00"
            meterLabel.text = "0.00"
            feetLabel.alpha = 1
            meterLabel.alpha = 1
        }
    }
    
    func installTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: labelContainer.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func installLabelContainerConstraints() {
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.topAnchor.constraint(equalTo: centerYAnchor, constant: -200).isActive = true
        labelContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func installButtonConstraints() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
