//
//  DetailCell.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 27/06/2021.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var ifLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func configureCell(acroModel: AcroModel) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
