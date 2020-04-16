import UIKit

class TimerView: UIView {
    let titleLabel = UILabel()
    let timerLabel = UILabel()
    let actionButton = UIButton()
    let feetLabel = UILabel()
    let meterLabel = UILabel()
    let labelContainer: UIStackView
    
    let startLabel = "START"
    
    enum TimerState {
        case ready
        case running
        case stopped
    }
    
    override init(frame: CGRect) {
        self.labelContainer = UIStackView(arrangedSubviews: [timerLabel, feetLabel, meterLabel])
        labelContainer.axis = .vertical
        labelContainer.spacing = 75.0
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(labelContainer)
        addSubview(actionButton)
        
        titleLabel.text = "Cliff Height Timer"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(40)
        
        timerLabel.text = "0.00"
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerLabel.font = timerLabel.font.withSize(60)

        
        feetLabel.textColor = .white
        feetLabel.textAlignment = .center
        feetLabel.font = feetLabel.font.withSize(60)

        meterLabel.textColor = .white
        meterLabel.textAlignment = .center
        meterLabel.font = meterLabel.font.withSize(60)

//        actionButton.backgroundColor = .white
        actionButton.layer.cornerRadius = 5.0
        actionButton.setTitle(startLabel, for: .normal)
        actionButton.setTitleColor(.blue, for: .normal)
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
    
    func installContraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTop = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 10)
        let titleLeading = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let titleTrailing = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let containerTop = NSLayoutConstraint(item: labelContainer, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        let containerLeading = NSLayoutConstraint(item: labelContainer, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let containerTrailing = NSLayoutConstraint(item: labelContainer, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonBottom = NSLayoutConstraint(item: actionButton, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 10)
        let buttonCenter = NSLayoutConstraint(item: actionButton, attribute: .centerX, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        let buttonMaxWidth = NSLayoutConstraint(item: actionButton, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([titleTop, titleLeading, titleTrailing, containerTop, containerLeading, containerTrailing, buttonBottom, buttonCenter, buttonMaxWidth])
    }
}
