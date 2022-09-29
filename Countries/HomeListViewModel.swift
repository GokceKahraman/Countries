//
//  HomeViewModel.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import Foundation

protocol HomeListViewModelViewProtocol: AnyObject{
    
    func didCellItemFetch(_ items : [CountryCellViewModel])
    
    
}

class HomeListViewModel{
    
    private let model = CountryListModel()

    
    weak var delegate: HomeListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    
    func didViewLoad(){
        model.fetchData()
    }
    
    func didClickItem (at index: Int){
//        TODO:
    }
}

private extension HomeListViewModel {
    
    @discardableResult
    func makeViewBasedModel () -> [CountryCellViewModel]{
        return []
    }
}


// MARK: - CountryListModelProtocol
extension HomeListViewModel : CountryListModelProtocol{
    
    func didDataFetch() {
//        TODO:
        delegate?.didCellItemFetch(makeViewBasedModel())
    }
    
}
