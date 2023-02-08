//
//  ViewController.swift
//  MVC-N
//
//  Created by Karen Vardanian on 08.02.2023.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!


}

extension CommentsViewController: UITableViewDelegate{}
extension CommentsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

