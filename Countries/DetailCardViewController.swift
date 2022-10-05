//
//  DetailCardViewController.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import UIKit
import SafariServices

class DetailCardViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    
    private let viewModel = DetailCardViewModel()

    var country: CountryCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureItems()

    }

    private func configureItems(){
        guard let country = country else { return }
        var someText = "Country Code : \(country.code ?? "")"
        self.countryCodeLabel.text = someText
        title = country.countryName ?? ""
        viewModel.country = country
        viewModel.didViewLoad()
    }
    
    
    @IBAction func moreInformationButton(_ sender: Any) {
//        send flagImageUri
    }
    
    
//    func showTutorial(_ which: Int) {
//        if let url = URL(string: "https://www.wikidata.org/wiki/\(wikiDataId)") {
//            let config = SFSafariViewController.Configuration()
//            config.entersReaderIfAvailable = true
//
//            let vc = SFSafariViewController(url: url, configuration: config)
//            present(vc, animated: true)
//        }
//    }
    
    //navigation controller button
    @IBAction func savedButton(_ sender: Any) {
        // check if website exists
        guard let country = country else { return }
        guard let url = URL(string: "https://www.wikidata.org/wiki/\(String(describing: country.wikiDataId))") else {
                return
            }

            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        
        safariVC.delegate = self

    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    

}
