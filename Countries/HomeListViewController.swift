//
//  ViewController.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import UIKit

class HomeListViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    private let viewModel = HomeListViewModel()
    private var items: [CountryCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.delegate = self
    }
}

private extension HomeListViewController{
    
    func setupUI(){
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }
}

extension HomeListViewController : HomeListViewModelViewProtocol{
    
    func didCellItemFetch(_ items: [CountryCellViewModel]) {
        self.items = items
        countriesTableView.reloadData()
    }
}

extension HomeListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    
}

extension HomeListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
