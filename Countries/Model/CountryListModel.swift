//
//  CountryModel.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import Foundation

protocol CountryListModelProtocol : AnyObject{
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class CountryListModel{
    
    weak var delegate : CountryListModelProtocol?
    
    var countries: [Country] = []
    
    func fetchData(){   //getting data
        
//MARK:  DATA from RapidApi - GeoDB GET Countries
        let headers = [
            "X-RapidAPI-Key": "bc7fe93d9dmsh354bfa90994d44dp13b8aejsnd2788b33b326",
            "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) //completionHandler:
                                            { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data = data else{
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            if (error != nil) {
//                print(error)
                self.delegate?.didDataFetchProcessFinish(false)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
            
                                                
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CountryResponseModel.self, from: data) //?
                self.countries = responseModel.data
                self.delegate?.didDataFetchProcessFinish(true)
            } catch{
                print("JSON Serilization error")
            }
            
        }
        dataTask.resume()
          
                
    }

}
