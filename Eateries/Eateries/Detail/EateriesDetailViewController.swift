//
//  EateriesDetailViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 23.01.2023.
//

import UIKit

class EateriesDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapButton: UIButton!
    var restaurant: Restaurant?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = [rateButton, mapButton].map{
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white.cgColor
        }
        
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension
        
        imageView.image = UIImage(named: restaurant!.image)
        
        //tableView.backgroundColor = .orange
        tableView.separatorColor = .magenta
        
        title = restaurant!.name
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
        //cell.backgroundColor = .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard let svc = segue.source as? RateViewController else { return }
        guard let rating = svc.restRating else { return }
        rateButton.setImage(UIImage(named: rating), for: .normal)
    }
    
}


