//
//  NetworkManager.swift
//  Project-13-FlipContainer
//
//  Created by suhail on 18/01/24.
//

import Foundation

struct NetworkManager{
    
    static let shared = NetworkManager()
    init(){}
    
    func fetchDataFromServer(completion: @escaping ([Country])->(Void)){
       
        let headers = [
            "X-RapidAPI-Key": "cd044bcf3emsh33f0a75fd47be40p1b66fbjsnd35495da702a",
            "X-RapidAPI-Host": "rest-countries10.p.rapidapi.com"
        ]
        
        let url = URL(string: "https://rest-countries10.p.rapidapi.com/countries")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
         URLSession.shared.dataTask(with: request) { data, response, error in
             if let error = error{
                 print("Error fetching data from the server")
                 print("#######")
                 print(error.localizedDescription)
                 return
             }
             
             if let data = data{
                 print("Data fetched from the server")
                 if let parsedData = parseJSON(unparsedData: data) {
                      completion(parsedData)
                 }
                 
             }
             
         }.resume()

    }
    
    func parseJSON(unparsedData: Data) -> [Country]?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Country].self, from: unparsedData)
            return decodedData
        }catch{
            print("Could not parse the data")
            print("########")
            print(error)
            return nil
        }
    }
    
}
