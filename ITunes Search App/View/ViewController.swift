//
//  ViewController.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 18.12.2021.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource  {

    

    @IBOutlet weak var tableView: UITableView!
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

    func updateSearchResults(for searchController: UISearchController){
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicTableViewCell
        
        return cell
    }
    
}

