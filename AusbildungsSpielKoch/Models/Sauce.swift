//
//  Sauce.swift
//  AusbildungsSpielKoch
//
//  Datenmodell für Saucen & Fonds (Lexikon)
//

import Foundation

struct Sauce: Identifiable, Codable {
    let id: String
    let name: String
    let typ: String
    let basis: String
    let beschreibung: String
    let verwendung: String
    let lagerung: String
    let ableitungen: String
}
