//
//  ViewController.swift
//  UIKitProgrammatically
//
//  Created by Karen Vardanian on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    var view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        setupView1()
        setupView2()
    }
    
    func setupView1()  {
        view1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupView2()  {
    
    }


}

