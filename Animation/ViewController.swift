//
//  ViewController.swift
//  Animation
//
//  Created by Bibizhan on 02.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import hkMotus

class ViewController: UIViewController, UITextFieldDelegate {

    
    let bgImageView : UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.image = UIImage(named: "b.jpg")
        bgImageView.contentMode = .scaleAspectFill
        return bgImageView
    }()
    
    let emailTextField : UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = UIColor.white
        emailTextField.layer.cornerRadius = 4
        emailTextField.placeholder = "Email"
        emailTextField.textColor = .white
       // emailTextField.layer.borderColor = UIColor.white.cgColor
        return emailTextField
    }()
    
    let passwordTextField : UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .white

        return passwordTextField
        
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.3){
            self.emailTextField.transform = CGAffineTransform.identity
        }
        
        view.addSubview(bgImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupConstraints()
        
    }

     @objc func logIn(){
        print("work")
        _ = SecondViewController(nibName: "SecondViewController", bundle: nil)
        present(SecondViewController(), animated: true, completion: nil)

    }
    
    func setupConstraints(){
        constrain(bgImageView,emailTextField, passwordTextField, signInButton, view){ bg, et, pt, bt, vw in
            bg.top == vw.top
            bg.left == vw.left
            bg.right == vw.right
            bg.bottom == vw.bottom
            
            et.center == bg.center
            et.width == 220
            et.height == 30
            pt.top == et.bottom  + 25
            pt.right == et.right
            pt.left == et.left
            pt.height == 30
            
            bt.top == pt.bottom + 20
            bt.right == pt.right -  60
            bt.left == pt.left + 60
           // bt.width == 100
            bt.height == 40
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signInButton.alpha = 0
        
        emailTextField.transform = CGAffineTransform.init(translationX: 0, y: -1000)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.emailTextField.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }) { (isCompleted) in
    }
        passwordTextField.transform = CGAffineTransform.init(translationX: 0, y: 1000)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.passwordTextField.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }) { (isCompleted) in
            if isCompleted{
                UIView.animate(withDuration: 1, animations: {
                    self.signInButton.alpha = 1
                })
            }
        }
        
    }
}




