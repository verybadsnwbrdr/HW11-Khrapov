//
//  ViewController.swift
//  HW11-Khrapov
//
//  Created by Anton on 18.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    
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
        loginButton.backgroundColor = UIColor(named: "logButtonColor")
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
        forgotPassButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        return forgotPassButton
    }()
    
    private lazy var connectWithLabel: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var band: UIView = {
        let band = UIView()
        band.backgroundColor = .lightGray
        band.alpha = 0.4
        return band
    }()
    
    private lazy var logWithFBButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor =  UIColor(named: "logWithFBColor")
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        button.layer.cornerRadius = 20

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        
        
        if let icon = UIImage(named: "facebook") {
            button.setLeftIcon(icon)
        }
        
        return button
    }()
    
    private lazy var logWithTwButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor =  UIColor(named: "logWithTwColor")
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        button.layer.cornerRadius = 20

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        
        if let icon = UIImage(named: "twitter") {
            button.setLeftIcon(icon)
        }
        
        return button
    }()
    
    private lazy var stackSocial: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logWithFBButton, logWithTwButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var labelDontHaveAcc: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(named: "logButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        return button
    }()
    
    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelDontHaveAcc, signUpButton])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewColor()
        setupHierarchy()
        setupLayout()
    }
    
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
        view.addSubview(band)
        view.addSubview(connectWithLabel)
        view.addSubview(stackSocial)
        view.addSubview(bottomStack)
    }
    
    private func setupLayout() {
        background.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(view)
            make.top.equalTo(view).offset(-100)
        }
        
        topLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view).offset(100)
        }
        
        loginField.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(40)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(loginField.snp.bottom).offset(20)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(50)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        band.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(view).offset(-160)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).inset(50)
        }
        
        connectWithLabel.snp.makeConstraints { make in
            make.left.equalTo(band).offset(95)
            make.right.equalTo(band).offset(-95)
            make.centerY.equalTo(band).offset(-2)
        }
        
        stackSocial.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-80)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(40)
        }
        
        bottomStack.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-30)
            make.centerX.equalTo(view)
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
        let iconView = UIImageView(frame: CGRect(x: 20, y: 9, width: 22, height: 22))
        iconView.image = image
        let iconContainerView: UIView = UIView()
        iconContainerView.addSubview(iconView)
        self.addSubview(iconContainerView)
    }
}
