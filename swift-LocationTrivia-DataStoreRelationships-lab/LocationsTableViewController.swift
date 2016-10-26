//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Enrique Torrendell on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    
    var store: LocationDataStore = LocationDataStore.shareInstance 

    override func viewDidLoad() {
        super.viewDidLoad()
        store.generateStartingLocationsData()
        
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLocation", for: indexPath) as! LocationsTableViewCell
        
        let index = indexPath.row
        let contentCell = store.locations[index]
        cell.textLabel?.text = contentCell.name
        cell.detailTextLabel?.text = "\(contentCell.trivia.count)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTrivia" {
            if let dest = segue.destination as? TriviaTableViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                dest.location = store.locations[indexPath.row]
            }
        }
        
    }
    
    
}
