//
//  ViewController.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }

}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
    
    
}
