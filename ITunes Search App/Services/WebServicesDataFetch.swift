//
//  WebServicesDataFetch.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 21.12.2021.
//

import Foundation

class WebServicesDataFetch {
/*    static let shared = WebServicesDataFetch()
    
    private init() {}
    
    func fetchAlbum(urlString: String, responce: @escaping (AlbumModel?, Error?) -> Void){
        WebServies.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(AlbumModel.self, from: data)
                    responce(albums, nil)
                } catch let jsonError {
                    print("Failed to decode Json", jsonError)
                    print("Hata1")
                }
                
            case .failure(let error):
                print("Error received reuesting data:\(error.localizedDescription)")
                responce(nil, error)
                print("Hata2")
            }
        }
    }*/
    
    
    func downloadAlbum(url: URL, completion: @escaping (AlbumModel?) -> Void){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let albumList = try? JSONDecoder().decode(AlbumModel.self, from: data)
                
                print(albumList)
                if let albumList = albumList{
                    completion(albumList)
                }
            }
                
        }.resume()
    }
    
}
