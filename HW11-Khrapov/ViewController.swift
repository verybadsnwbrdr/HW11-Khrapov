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
//        topLabel.shadowColor = .gray
//        boldSystemFont(ofSize: 40)
        topLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        return topLabel
    }()
    
    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "keanureeves01"
        loginField.textAlignment = .center
        loginField.backgroundColor = .white
        loginField.layer.cornerRadius = 25
        return loginField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.textAlignment = .center
        passwordField.backgroundColor = .white
        passwordField.layer.cornerRadius = 25
        return passwordField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    }
    
    // MARK: - Actions
    
    
}

