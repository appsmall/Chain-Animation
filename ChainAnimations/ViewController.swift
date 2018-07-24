//
//  ViewController.swift
//  ChainAnimations
//
//  Created by Shashank Panwar on 18/07/18.
//  Copyright © 2018 Kayosys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()

    fileprivate func setupLabels() {
//        titleLabel.backgroundColor = UIColor.red
//        bodyLabel.backgroundColor = UIColor.green
        titleLabel.text = "Welcome to Kayosys"
        titleLabel.font = UIFont(name: "Futura", size: 32)
        titleLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Thanks for downloading our brand new app and giving us a try. Make sure to leave a good review on the Appstore."
        bodyLabel.font = UIFont(name: "Futura", size: 16)
        bodyLabel.numberOfLines = 0
    }
    
    
    fileprivate func setupStackView() {
        let stackview = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackview.axis = .vertical
        view.addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupStackView()
        
        //fun animation
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
        
    }

    @objc func handleTapAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (ok) in
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: self.titleLabel.frame.origin.x, y: -200)
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.7, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = CGAffineTransform(translationX: self.bodyLabel.frame.origin.x, y: -200)
            }, completion: nil)
        }
    }

}

