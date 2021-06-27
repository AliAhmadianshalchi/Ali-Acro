//
//  AcronymDetailsTableView.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 21/06/2021.
//

import UIKit

class AcronymDetailsTableView: UITableViewController {
    
    var acroModel: AcroModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    
    }
    
    fileprivate func setup() {
        if let sf = acroModel?.sf {
            self.navigationController?.navigationBar.topItem?.title = "\(sf)"
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

// MARK: - UITableView Delegate - Datasource
extension AcronymDetailsTableView {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acroModel!.lfs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        cell.ifLabel.text = "lfs: \(acroModel!.lfs[indexPath.row].lf)"
        cell.frequencyLabel.text = "freq: \(acroModel!.lfs[indexPath.row].freq)"
        cell.yearLabel.text = "since: \(acroModel!.lfs[indexPath.row].since)"
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
