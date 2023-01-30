//
//  RateViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 30.01.2023.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var brilliantButton: UIButton!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 0.4) {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//
//        }
        let buttonArray = [badButton, goodButton, brilliantButton]
        
        
        for (index, button) in buttonArray.enumerated() {
            UIView.animate(withDuration: 0.4, delay: Double(index) * 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseIn) {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonArray = [badButton, goodButton, brilliantButton]
        buttonArray.map{$0?.transform = CGAffineTransform(scaleX: 0, y: 0)}
        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
