//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) weak var countryName: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var countryModel: CountryCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    

    func configure(viewModel: CountryCellViewModel){
        countryModel = viewModel
        guard let countryModel else { return }
        countryName.text = countryModel.countryName
    }


    @IBAction func savedButton(_ sender: UIButton) {
        let countries = SavedCountriesManager.shared.countries
        guard let countryModel = countryModel else { return }
        if sender.isSelected {
            for (index,country) in countries.enumerated() {
                if countryModel.code == country.code {
                    SavedCountriesManager.shared.countries.remove(at: index)
                }
            }
        } else {
            SavedCountriesManager.shared.countries.append(countryModel)
        }
        
        sender.isSelected = !sender.isSelected
    }
    
}
