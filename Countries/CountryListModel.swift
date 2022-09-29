//
//  CountryModel.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import Foundation

protocol CountryListModelProtocol : AnyObject{
    func didDataFetch()
}

class CountryListModel{
    
    weak var delegate : CountryListModelProtocol?
    
    
    
    func fetchData(){
        //Todo:
        delegate?.didDataFetch()
        
    }
}
