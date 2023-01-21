//
//  ViewController.swift
//  TableViewApp
//
//  Created by Karen Vardanian on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurants = ["balkan","bochka","bonsai","dastarhan","elu","indokitay","istorii","klassik","love","morris","ogonek","respublika","shok","speakeasy","x.o"]
    
    let restaurantesImages = ["balkan","bochka","bonsai","dastarhan","elu","indokitay","istorii","klassik","love","morris","ogonek","respublika","shok","speakeasy","x.o"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Arial", size: 24)
        cell.textLabel?.text = restaurants.sorted()[indexPath.row].capitalized
        cell.imageView?.image = UIImage(named: restaurantesImages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

