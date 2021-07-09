//
//  GenericTableViewController.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 24/05/2021.
//

import Foundation
import UIKit

// MARK:- Generic Table View Controller
class GenericTableViewController<T: GenericTableViewCell<U>, U>: UITableViewController {
    var items = [U]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(T.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! T
        
        cell.item = items[indexPath.row]
        
        return cell
    }
}

// MARK:- Generic Table View Cell
class GenericTableViewCell<U>: UITableViewCell {
    var item: U!
}
