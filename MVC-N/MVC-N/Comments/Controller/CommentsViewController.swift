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

extension CommentsViewController: UITableViewDelegate{
    
}

extension CommentsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentCell
        
        
        return cell
    }
}

