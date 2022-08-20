//
//  ViewController.swift
//  HW11-Khrapov
//
//  Created by Anton on 18.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - Outlets
    
    private lazy var background: UIImageView = {
        let image = UIImage(named: "background")
        let background = UIImageView(image: image)
        background.contentMode = .scaleAspectFit
        return background
    }()
    
    private lazy var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Login"
        topLabel.textColor = .white
        topLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        return topLabel
    }()
    
    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "keanureeves01"
        loginField.textAlignment = .left
        loginField.backgroundColor = .white
        loginField.layer.cornerRadius = 25
        
        if let icon = UIImage(named: "person") {
            loginField.setLeftIcon(icon)
        }

        if let icon = UIImage(named: "checkmark") {
            loginField.setRightIcon(icon)
        }
        
        loginField.layer.shadowColor = UIColor.black.cgColor
        loginField.layer.shadowOpacity = 0.3
        loginField.layer.shadowOffset = .zero
        loginField.layer.shadowRadius = 10
        loginField.layer.shouldRasterize = true
        loginField.layer.rasterizationScale = UIScreen.main.scale
        
        return loginField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.textAlignment = .left
        passwordField.backgroundColor = .white
        passwordField.layer.cornerRadius = 25

        if let icon = UIImage(named: "lock") {
            passwordField.setLeftIcon(icon)
        }
        
        passwordField.layer.shadowColor = UIColor.black.cgColor
        passwordField.layer.shadowOpacity = 0.3
        passwordField.layer.shadowOffset = .zero
        passwordField.layer.shadowRadius = 10
        passwordField.layer.shouldRasterize = true
        passwordField.layer.rasterizationScale = UIScreen.main.scale
        
        return passwordField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        loginButton.layer.cornerRadius = 25
        loginButton.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)

        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.3
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowRadius = 10
        loginButton.layer.shouldRasterize = true
        loginButton.layer.rasterizationScale = UIScreen.main.scale
        
        return loginButton
    }()
    
    private lazy var forgotPassButton: UIButton = {
        let forgotPassButton = UIButton(type: .system)
        forgotPassButton.setTitle("Forgot your password?", for: .normal)
        forgotPassButton.setTitleColor(.white, for: .normal)
        forgotPassButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        
        return forgotPassButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewColor()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Lifecycle
    
    
    // MARK: - Setup
    
    private func setupViewColor() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(background)
        view.addSubview(topLabel)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(forgotPassButton)
    }
    
    private func setupLayout() {
        background.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(view)
            make.top.equalTo(view).offset(-100)
//            make.bottom.equalTo(view).offset(50)
//            make.width.equalTo(view.snp.width)
        }
        
        topLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view).offset(100)
        }
        
        loginField.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
            make.top.equalTo(topLabel.snp.bottom).offset(40)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        passwordField.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
            make.top.equalTo(loginField.snp.bottom).offset(20)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
            make.top.equalTo(passwordField.snp.bottom).offset(50)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Actions
    @objc private func loginBtnPressed() {
        
    }
    
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 50, y: 17, width: 14, height: 16))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 50, y: 0, width: 80, height: 50))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 30, y: 16, width: 18, height: 18))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 50, y: 0, width: 65, height: 50))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}



extension UIButton {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 30, y: 16, width: 18, height: 18))
        iconView.image = image
        let iconContainerView: UIView = UIView()
        iconContainerView.addSubview(iconView)
        self.addSubview(iconContainerView)
    }
}
