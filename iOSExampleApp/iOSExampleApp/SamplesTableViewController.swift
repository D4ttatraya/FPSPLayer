//
//  SamplesTableViewController.swift
//  iOSExampleApp
//
//  Created by D4ttatraya on 23/09/20.
//

import UIKit

class SamplesTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllSamples.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCellId", for: indexPath)
        
        let sample = AllSamples[indexPath.row]
        cell.textLabel?.text = sample.title
        cell.detailTextLabel?.text = sample.info

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playerViewController = segue.destination as? PlayerViewController,
           let indexPath = self.tableView.indexPathForSelectedRow {
            playerViewController.sample = AllSamples[indexPath.row]
        }
    }

}
