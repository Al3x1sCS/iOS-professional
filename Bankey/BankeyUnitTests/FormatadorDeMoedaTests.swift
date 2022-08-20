//
//  FormatadorDeMoedaTests.swift
//  BankeyUnitTests
//
//  Created by user on 19/08/22.
//

import Foundation

import XCTest

@testable import Bankey

class FormatadorDeMoedaTests: XCTestCase {
    var formatador: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatador = CurrencyFormatter()
    }
    
    func testReaisFormatados() throws {
        let result = formatador.dollarsFormatted(929466.23)
                XCTAssertEqual(result, "R$ 929.466,23")
    }
    
    func testQuebrarReaisEmCentavos() throws {
        let result = formatador.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "$ 929.466")
        XCTAssertEqual(result.1, "23")
    }
    

    
    func testFormatarZeroReais() throws {
        let result = formatador.dollarsFormatted(0.00)
                XCTAssertEqual(result, "R$ 0,00")
    }
        
}


