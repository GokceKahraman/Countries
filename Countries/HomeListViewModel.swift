//
//  HomeViewModel.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import Foundation

protocol HomeListViewModelViewProtocol: AnyObject{
    
    func didCellItemFetch(_ items : [CountryCellViewModel])
    func showEmptyView()
    func hideEmptyView()
    
}

class HomeListViewModel{
    
    private let model = CountryListModel()

    
    weak var viewDelegate: HomeListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    var savedCountries = [Int: Bool]()
    
    func didViewLoad(){
        model.fetchData()
    }
    
    
    func didClickItem (at index: Int){
        let selectedItem = model.countries[index]
//        NAVIGATE
    }
}

private extension HomeListViewModel {
    
    @discardableResult
    func makeViewBasedModel (_ countries: [Country]) -> [CountryCellViewModel]{
        return countries.map{ .init(countryName : $0.name, code: $0.code, wikiDataId: $0.wikiDataId)}
    }
}


// MARK: - CountryListModelProtocol
extension HomeListViewModel : CountryListModelProtocol{
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess{
            let countries = model.countries
            let cellModels = makeViewBasedModel(countries)
            viewDelegate?.didCellItemFetch(cellModels)
        }else{
            
        }
        
//        TODO:
    }
    
}
