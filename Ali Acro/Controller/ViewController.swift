//
//  ViewController.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 21/06/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
    }
    
    fileprivate func setupUIComponents() {
        self.searchButton.layer.cornerRadius = 10
        self.searchTextField.layer.cornerRadius = 30
    }
    
    fileprivate func showNoMatchesFoundAlert() {
        let alert = UIAlertController(title: "Atention", message: "No matches found. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Oki", style: .default, handler: { (_) in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        guard let acronym = self.searchTextField.text else {
            return
        }
        
        API.getAcroDef(acronym: acronym) { (acroModel) in
        
            guard let acroModel = acroModel else {
                DispatchQueue.main.async {
                    self.showNoMatchesFoundAlert()
                }
                return
            }
            
            DispatchQueue.main.async {
                let acronymDefinitionVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsTableView") as! AcronymDetailsTableView
                let navigationController = UINavigationController(rootViewController: acronymDefinitionVC)
                acronymDefinitionVC.acroModel = acroModel
                self.present(navigationController, animated: true, completion: nil)
            }
        
        
    }
    

}
}
