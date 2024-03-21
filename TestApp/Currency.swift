//
//  Currency.swift
//  TestApp
//
//  Created by www.abcom.in on 19/03/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    // default -> copperPenny = 0.0000000, silverPiece = 1.00000 ....
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
//    var idRaw: Double = { rawValue }
    
    var image: ImageResource {
        switch self {
            case .copperPenny: .copperpenny
            case .silverPenny : .silverpenny
            case .silverPiece : .silverpiece
            case .goldPenny : .goldpenny
            case .goldPiece : .goldpiece
        }
    }
    
    var name: String {
        switch self {
            case .copperPenny: "copper penny"
            case .silverPenny : "silver penny"
            case .silverPiece : "silver piece"
            case .goldPenny : "gold penny"
            case .goldPiece : "gold piece"
        }
    }
}
