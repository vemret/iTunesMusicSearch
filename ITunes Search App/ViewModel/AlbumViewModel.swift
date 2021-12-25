//
//  AlbumViewModel.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 25.12.2021.
//

import Foundation
import UIKit

struct AlbumListViewModel {
    let albumList : AlbumModel
    
}

extension AlbumListViewModel {
    
    var albumCount : Int {
        return self.albumList.resultCount
    }
    
    var albumArray : Array<Any> {
        return self.albumList.results
    }
    
    func numberOfRowsInSection() -> Int{
        return albumCount
    }
    
    func albumAtIndex( index: Int) -> AlbumViewModel {
        let album = albumArray[index]
        return AlbumViewModel(album: album as! Album)
    }
}

struct AlbumViewModel {
    let album : Album
    
}

extension AlbumViewModel {
    var artistName : String {
        return self.album.artistName
    }
    var trackName : String {
        return self.album.trackName
    }
    var previewUrl : String {
        return self.album.previewUrl
    }
    /*var albumImg: NSData {
        let image = NSData(contentsOf: URL(string: self.album.artworkUrl60)!)
        return image!
    }*/
    var imgUrl : String {
        return self.album.artworkUrl60
    }
}
