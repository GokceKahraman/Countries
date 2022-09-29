//
//  SavedViewController.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import UIKit

class SavedViewController : UIViewController {
    
    @IBOutlet weak var savedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
        
    }
    
}

extension SavedViewController : UITableViewDelegate{
    
}

extension SavedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
    
    
}
