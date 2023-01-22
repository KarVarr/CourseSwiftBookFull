//
//  EateriesDetailViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 23.01.2023.
//

import UIKit

class EateriesDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)
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
