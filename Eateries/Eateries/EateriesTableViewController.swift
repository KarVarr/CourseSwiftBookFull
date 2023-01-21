//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 21.01.2023.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurantsNames = ["balkan","bochka","bonsai","dastarhan","elu","indokitay","istorii","klassik","love","morris","ogonek","respublika","shok","speakeasy","x.o"]
    
    var restaurantesImages = ["balkan","bochka","bonsai","dastarhan","elu","indokitay","istorii","klassik","love","morris","ogonek","respublika","shok","speakeasy","x.o"]
    
    var restaurantIsVisited = [Bool](repeatElement(false, count: 15))
    
    var phoneNumbers = ["+1 304 333 86", "+1 456 443 33", "+1 123 345 55","+1 777 366 84","+1 304 456 83","+1 388 888 36","+1 311 323 81","+1 545 563 44","+1 987 87 87","+1 666 567 56","+1 877 908 66","+1 304 300 98","+1 456 333 86","+1 304 456 12","+1 304 987 00",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantsNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        cell.thumbnailImageVIew.image = UIImage(named: restaurantesImages[indexPath.row])
        cell.thumbnailImageVIew.layer.cornerRadius = cell.thumbnailImageVIew.frame.size.height / 2
        cell.thumbnailImageVIew.clipsToBounds = true
        cell.thumbnailImageVIew.contentMode = .scaleAspectFill
        cell.nameLabel.text = restaurantsNames[indexPath.row].capitalized
        
        cell.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
        
        let call = UIAlertAction(title: "Call \(phoneNumbers[indexPath.row])", style: .default) { ac in
            let ac = UIAlertController(title: "Warning", message: "You can't call on this phone number", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(ac, animated: true)
        }
        
        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ?  "Delete Pin" : "Pin Place"
        
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { ac in
            let cell = tableView.cellForRow(at: indexPath)
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(call)
        ac.addAction(isVisited)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.restaurantesImages.remove(at: indexPath.row)
            self.restaurantsNames.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.phoneNumbers.remove(at: indexPath.row)
        }
//        tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
}
