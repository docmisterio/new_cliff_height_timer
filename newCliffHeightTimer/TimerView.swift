import UIKit

class TimerView: UIView {
    let titleLabel = UILabel()
    let timerLabel = UILabel()
    let actionButton = UIButton()
    
    let startLabel = "START"
    
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
        actionButton.setTitle(startLabel, for: .normal)
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
        let buttonCenter = NSLayoutConstraint(item: actionButton, attribute: .centerX, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        let buttonMaxWidth = NSLayoutConstraint(item: actionButton, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([titleTop, titleLeading, titleTrailing, timerTop, timerLeading, timerTrailing, buttonBottom, buttonCenter, buttonMaxWidth])
    }
}
