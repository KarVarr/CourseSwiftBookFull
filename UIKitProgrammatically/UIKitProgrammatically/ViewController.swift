//
//  ViewController.swift
//  UIKitProgrammatically
//
//  Created by Karen Vardanian on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PUSH", for: .normal)
        button.backgroundColor = .magenta
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(button)
        
        setupView1()
        setupView2()
        setupButton()
    }
    
    func setupView1()  {
        view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        view1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupView2()  {
        view2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        view2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //view2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
    }
    
    func setupButton() {
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}

