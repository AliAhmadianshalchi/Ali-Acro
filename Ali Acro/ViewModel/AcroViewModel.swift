//
//  AcroViewModel.swift
//  Ali Acro
//
//  Created by Ali Ahmadian shalchi on 26/07/2021.
//

import Foundation
import UIKit

struct AcroListViewModel {
    // TODO
    var service = WebService<AcroModel>()
    let acroModels: [AcroModel]

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.acroModels.count
    }
    
    func articleAtIndex(_ index: Int) -> AcroModel {
        let acro = self.acroModels[index]
        return acro
    }
    
    var numberOfSections: Int {
        return 1
    }
    
  
}


struct AcroViewModel {
    
    private let acro: AcroModel
    
}

