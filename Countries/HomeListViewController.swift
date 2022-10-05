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
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
}

private extension HomeListViewController{
    
    func setupUI(){
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        registerCell()
    }
    
    func registerCell(){
        countriesTableView.register(.init(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
}

extension HomeListViewController : HomeListViewModelViewProtocol{
    
    func didCellItemFetch(_ items: [CountryCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.countriesTableView.reloadData()

        }
    }
    func showEmptyView(){}
    func hideEmptyView(){}
}

extension HomeListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didClickItem(at: indexPath.row)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailCardViewController") as? DetailCardViewController{
            vc.country = items[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension HomeListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        cell.configure(viewModel: items[indexPath.row])
        return cell
    }
}
