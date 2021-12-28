//
//  ViewController.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 18.12.2021.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var albumListViewModel : AlbumListViewModel!
    var timer : Timer?
    var imgData = Data()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
      
        
        navigationItem.title = "Music Search App."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    
    func fetchData(albumName: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(albumName)&entity=musicVideo") else {
            return
        }
        
        WebServicesDataFetch().downloadAlbum(url: url) { (albums) in
            if let albums = albums {
                self.albumListViewModel = AlbumListViewModel(albumList: albums)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController){
        guard let text = searchController.searchBar.text else {
            return
        }
        if text != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
                self?.fetchData(albumName: text)
            })
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumListViewModel == nil ? 0 : self.albumListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicTableViewCell
        
        let albumViewModel = self.albumListViewModel.albumAtIndex(index: indexPath.row)
        
        
        DispatchQueue.global().async {
            self.imgData = try! Data(contentsOf: URL(string: albumViewModel.imgUrl)!)
            DispatchQueue.main.async {
                cell.musicIMG.image = UIImage(data: self.imgData)
                cell.albumNameLabel.text = albumViewModel.trackName
                cell.artistNameLabel.text = albumViewModel.artistName
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        Show Music Details
        let vc = SFSafariViewController(url: URL(string: albumListViewModel.albumAtIndex(index: indexPath.row).previewUrl)!)
        
        present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
}

