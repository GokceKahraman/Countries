//
//  DetailCardViewModel.swift
//  Countries
//
//  Created by Gökçe Kahraman on 2.10.2022.
//

import Foundation

protocol DetailCardViewModelViewProtocol: AnyObject{
    
    func didCellItemFetch(_ items : [CountryDetailsViewModel])
    func showEmptyView()
    func hideEmptyView()
    
}

class DetailCardViewModel{
    
    private let model = DetailListModel()

    var country: CountryCellViewModel?
    
    weak var viewDelegate: HomeListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    var savedCountries = [Int: Bool]()
    
    func didViewLoad(){
        guard let country = country else { return }
        model.fetchData(code: country.code ?? "")
    }
    
}

private extension DetailCardViewModel {
    
    @discardableResult
    func makeViewBasedModel (_ countries: [Country]) -> [CountryDetailsViewModel]{
        return countries.map{ .init(flagImageUri : $0.flagImageUri, code: $0.code)}
    }
}


// MARK: - CountryListModelProtocol
extension DetailCardViewModel : DetailListModelProtocol{
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess{
            
            
        }else{
            
        }
        
//        TODO:
    }
    
}
