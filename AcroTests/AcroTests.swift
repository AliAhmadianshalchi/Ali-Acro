//
//  AcroTests.swift
//  Ali AcroTests
//
//  Created by Ali Ahmadian on 28/06/2021.
//

import Foundation
import Quick
import Nimble
@testable import Ali_Acro

class AcroTests: QuickSpec {
    
    let fakeAcro: String = "ASAP"
    
    override func spec() {
        
        beforeEach {
            
        }
        
        afterEach {
            
        }
        
        describe("when pressing search after entering the Acronym"){
            
            context("for the predefined value of the Acronym"){
                
                it("the response value should not be nil"){
                    
                    WebService<AcroModel>.getAcroDef(acronym: self.fakeAcro) { response in
                        expect(response).notTo(beNil())
                    } failureClosure: { error in
                        fail()
                    }
                    
                }
            }
        }
    }
}
