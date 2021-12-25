//
//  AlbumModel.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 19.12.2021.
//

import Foundation

//codedable => Decodable & EnCodable

struct AlbumModel : Decodable {
    let resultCount : Int
    let results : [Album]
    
    private enum CodingKeys: String, CodingKey {
        case results  = "results"
        case resultCount  = "resultCount"
    }
}

struct Album : Decodable {
    let artistName : String
    let trackName : String
    let previewUrl : String
    let artworkUrl60 : String
    
    private enum CodingKeys: String, CodingKey {
        case artistName  = "artistName"
        case trackName  = "trackName"
        case previewUrl  = "previewUrl"
        case artworkUrl60  = "artworkUrl60"
    }
}
