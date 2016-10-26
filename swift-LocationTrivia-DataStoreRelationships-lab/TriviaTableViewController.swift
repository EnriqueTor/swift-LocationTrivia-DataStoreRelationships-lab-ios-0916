//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Enrique Torrendell on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityLabel = "Trivia Table"
        tableView.accessibilityIdentifier = "Trivia Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath) as! TriviaTableViewCell
        
        let index = indexPath.row
        let contentCell = location.trivia[index]    
        cell.triviaText?.text = contentCell.content
        cell.triviaDetail?.text = String(contentCell.likes)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triviaSegue" {
            if let dest = segue.destination as? AddTriviaViewController {
                dest.location = location
                
                
            }
        }
        
    }
}
