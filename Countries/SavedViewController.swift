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
        registerCell()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedTableView.reloadData()
    }
    
    func registerCell(){
        savedTableView.register(.init(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
}

extension SavedViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailCardViewController") as? DetailCardViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension SavedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedCountriesManager.shared.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        cell.configure(viewModel: SavedCountriesManager.shared.countries[indexPath.row])
        cell.starButton.isHidden = true
        return cell
    }
    
    
}
