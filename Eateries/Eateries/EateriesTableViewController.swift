//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 21.01.2023.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant (name: "Ogonëk Grill&Bar", type: "ресторан", location: "Уф", image: "ogonek.jpg", isVisited: false, phoneNumbers: "+1 304 987 00"),
        Restaurant (name: "Елу", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false, phoneNumbers: "+1 304 456 12"),
        Restaurant (name:"Bonsai", type: "ресторан", location: "ya", image: "bonsai.jpg", isVisited: false, phoneNumbers: "+1 456 333 86"),
        Restaurant (name:"Дастархан", type: "ресторан", location: "Уф", image: "dastarhan.jpg", isVisited: false, phoneNumbers: "+1 304 300 98"),
        Restaurant (name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false, phoneNumbers: "+1 877 908 66"),
        Restaurant (name: "X.O", type: "ресторан-клуб", location: "ya", image: "x.o.jpg", isVisited: false, phoneNumbers: "+1 666 567 56"),
        Restaurant (name: "Балкан Гриль", type: "ресторан", location: "Уф", image: "balkan.jpg", isVisited: false, phoneNumbers: "+1 987 87 87"),
        Restaurant (name: "Respublica", type: "ресторан", location: "ya", image: "respublika.jpg", isVisited: false, phoneNumbers: "+1 545 563 44"),
        Restaurant (name: "Speak Easy", type: "ресторанный комплекс",location: "Уфа", image: "speakeasy.jpg", isVisited: false, phoneNumbers: "+1 311 323 81"),
        Restaurant (name: "Morris Pub", type: "ресторан", location: "ф", image: "morris.jpg", isVisited: false, phoneNumbers: "+1 388 888 36"),
        Restaurant (name: "Вкусные истории", type: "ресторан", location: "ф", image: "istorii.jpg", isVisited: false, phoneNumbers: "+1 304 456 83"),
        Restaurant (name: "Классик", type: "ресторан", location: "Y@a", image: "klassik.jpg", isVisited: false, phoneNumbers: "+1 777 366 84"),
        Restaurant (name: "Love&Life", type: "ресторан", location: "ф", image: "love.jpg", isVisited: false, phoneNumbers: "+1 123 345 55"),
        Restaurant (name: "Шок", type: "ресторан", location: "Уф", image: "shok.jpg", isVisited: false, phoneNumbers: "+1 456 443 33"),
        Restaurant (name: "Бочка", type: "ресторан", location: "фа", image: "bochka.jpg", isVisited: false, phoneNumbers: "+1 304 333 86"),
    ]
    
    
    
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
        return restaurants.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.thumbnailImageView.contentMode = .scaleAspectFill
        cell.nameLabel.text = restaurants[indexPath.row].name
        
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
        
        let call = UIAlertAction(title: "Call \(restaurants[indexPath.row].phoneNumbers)", style: .default) { ac in
            let ac = UIAlertController(title: "Warning", message: "You can't call on this phone number", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(ac, animated: true)
        }
        
        let isVisitedTitle = self.restaurants[indexPath.row].isVisited ?  "Delete Pin" : "Pin Place"
        
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { ac in
            let cell = tableView.cellForRow(at: indexPath)
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(call)
        ac.addAction(isVisited)
        ac.addAction(cancel)
        present(ac, animated: true)
        
        
    }
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
    //        forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            self.restaurantesImages.remove(at: indexPath.row)
    //            self.restaurantsNames.remove(at: indexPath.row)
    //            self.restaurantIsVisited.remove(at: indexPath.row)
    //            self.phoneNumbers.remove(at: indexPath.row)
    //        }
    ////        tableView.reloadData()
    //        tableView.deleteRows(at: [indexPath], with: .fade)
    //    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            let defaultText = "Right now i'm in " + self.restaurants[indexPath.row].name
            if let image = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated:  true)
            }
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        share.backgroundColor = .magenta
        delete.backgroundColor = .cyan
        return [delete, share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! EateriesDetailViewController
                dvc.imageName = self.restaurants[indexPath.row].image
            }
        }
    }
    
}
