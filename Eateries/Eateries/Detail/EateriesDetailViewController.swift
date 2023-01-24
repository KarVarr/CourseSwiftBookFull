//
//  EateriesDetailViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 23.01.2023.
//

import UIKit

class EateriesDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var restaurant: Restaurant?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: restaurant!.image)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row {
        case 0 :
            cell.keyValue.text = "Name"
            cell.valueLabel.text = restaurant!.name
        case 1 :
            cell.keyValue.text = "Type"
            cell.valueLabel.text = restaurant!.type
        case 2:
            cell.keyValue.text = "Address"
            cell.valueLabel.text = restaurant!.location
        case 3 :
            cell.keyValue.text = "I was there?"
            cell.valueLabel.text = restaurant!.isVisited ? "Yes" : "No"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


