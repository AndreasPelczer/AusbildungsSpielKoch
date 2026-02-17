//
//  LexikonQuizGenerator.swift
//  AusbildungsSpielKoch
//
//  Automatische Fragen-Generierung aus Lexikon-Daten
//  Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten → Synthetisieren
//
//  Halbjahr 3 (Level 12-20): Grundlagen-Taxonomie
//  Level 12-13: ERKENNEN  – Produkte, Garmethoden, Saucen identifizieren
//  Level 14-15: ZUORDNEN  – Kategorien und Typen zuweisen
//  Level 16-17: WISSEN    – Fakten abrufen (Lagerung, Temperatur, Allergene)
//  Level 18-19: ANWENDEN  – Praxissituationen lösen
//  Level 20:    BEWERTEN  – Aussagen beurteilen, Fehler erkennen
//
//  Halbjahr 5 (Level 21-25): Prüfungsvorbereitung
//  Level 21: PRÜFUNG MIX 1  – HACCP, Hygiene, Wareneingang
//  Level 22: PRÜFUNG MIX 2  – Garmethoden, Nährwerte, Allergene
//  Level 23: PRÜFUNG MIX 3  – Saucen, Fonds, klassische Küche
//  Level 24: PRÜFUNG MIX 4  – Komplexe Praxissituationen
//  Level 25: PRÜFUNG MIX 5  – Lagerhaltung, Arbeitssicherheit, Mix
//
//  Halbjahr 6 (Level 26-30): Meisterklasse (IHK-Niveau)
//  Level 26: EXPERTE WISSEN      – Tiefes Fachwissen
//  Level 27: EXPERTE ANWENDEN    – Komplexe Praxisszenarien
//  Level 28: EXPERTE BEWERTEN    – Kritische Analyse
//  Level 29: SYNTHETISIEREN      – Kreative Problemlösung
//  Level 30: MEISTER             – Härteste Fragen, alles kombiniert
//

import Foundation

class LexikonQuizGenerator {

    // MARK: - Öffentliche API

    /// Welche Levels werden von diesem Generator abgedeckt?
    static let generatedLevels: Set<Int> = Set(12...30)

    /// Generiert Fragen für ein bestimmtes Level aus Lexikon-Daten
    static func generateQuestions(forLevel level: Int) -> [Question] {
        let produkte = LexikonLoader.loadProdukte()
        let garmethoden = LexikonLoader.loadGarmethoden()
        let saucen = LexikonLoader.loadSaucen()

        switch level {
        // Halbjahr 3: Grundlagen-Taxonomie
        case 12: return erkennenProdukte(level: level, produkte: produkte)
        case 13: return erkennenGarmethodenSaucen(level: level, garmethoden: garmethoden, saucen: saucen)
        case 14: return zuordnenProdukte(level: level, produkte: produkte)
        case 15: return zuordnenGarmethodenSaucen(level: level, garmethoden: garmethoden, saucen: saucen)
        case 16: return wissenProdukte(level: level, produkte: produkte)
        case 17: return wissenGarmethodenSaucen(level: level, garmethoden: garmethoden, saucen: saucen)
        case 18: return anwendenPraxis(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 19: return anwendenCrossDomain(level: level, garmethoden: garmethoden, saucen: saucen)
        case 20: return bewerten(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)

        // Halbjahr 5: Prüfungsvorbereitung
        case 21: return pruefungMix1(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 22: return pruefungMix2(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 23: return pruefungMix3(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 24: return pruefungMix4(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 25: return pruefungMix5(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)

        // Halbjahr 6: Meisterklasse
        case 26: return experteWissen(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 27: return experteAnwenden(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 28: return experteBewerten(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 29: return synthetisieren(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)
        case 30: return meisterLevel(level: level, produkte: produkte, garmethoden: garmethoden, saucen: saucen)

        default: return []
        }
    }

    // MARK: - Level 12: ERKENNEN – Produkte

    private static func erkennenProdukte(level: Int, produkte: [Produkt]) -> [Question] {
        var questions: [Question] = []
        let kategorien = Array(Set(produkte.map { $0.kategorie })).sorted()
        let alleNamen = produkte.map { $0.name }

        // Template A: "Welches Produkt gehört zur Kategorie X?"
        for kategorie in kategorien {
            let richtige = produkte.filter { $0.kategorie == kategorie }
            let falsche = produkte.filter { $0.kategorie != kategorie }
            guard let produkt = richtige.randomElement(), falsche.count >= 3 else { continue }

            let wrong = pickRandom(from: falsche.map { $0.name }, count: 3)
            questions.append(makeQ(
                level: level,
                text: "Welches dieser Lebensmittel geh\u{00F6}rt zur Kategorie "\(kategorie)"?",
                correct: produkt.name,
                wrong: wrong,
                erklaerung:  \(produkt.name) geh\u{00F6}rt zur Kategorie \(kategorie). \(firstSentence(produkt.beschreibung))
            ))
        }

        // Template B: Beschreibung → Produkt erkennen
        for produkt in produkte.shuffled().prefix(20) {
            let beschr = firstSentence(produkt.beschreibung)
            guard !beschr.isEmpty else { continue }
            let wrong = pickRandom(from: alleNamen, not: produkt.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Um welches Produkt handelt es sich?\n"\(beschr)"",
                correct: produkt.name,
                wrong: wrong,
                erklaerung:  \(produkt.name): \(beschr)
            ))
        }

        return questions
    }

    // MARK: - Level 13: ERKENNEN – Garmethoden & Saucen

    private static func erkennenGarmethodenSaucen(level: Int, garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let alleSaucen = saucen.map { $0.name }

        // Template A: Medium → Garmethode erkennen
        for methode in garmethoden {
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Garmethode verwendet "\(methode.medium)" als Garmedium?",
                correct: methode.name,
                wrong: wrong,
                erklaerung:  \(methode.name) arbeitet mit \(methode.medium) bei \(methode.temperatur)."
            ))
        }

        // Template B: Beschreibung → Garmethode erkennen
        for methode in garmethoden.shuffled().prefix(10) {
            let beschr = firstSentence(methode.beschreibung)
            guard !beschr.isEmpty else { continue }
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Garmethode wird hier beschrieben?\n"\(beschr)"",
                correct: methode.name,
                wrong: wrong,
                erklaerung:  \(methode.name): \(beschr)
            ))
        }

        // Template C: Basis → Sauce erkennen
        for sauce in saucen {
            let wrong = pickRandom(from: alleSaucen, not: sauce.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Sauce hat diese Basis?\n"\(sauce.basis)"",
                correct: sauce.name,
                wrong: wrong,
                erklaerung:  \(sauce.name) basiert auf: \(sauce.basis)."
            ))
        }

        return questions
    }

    // MARK: - Level 14: ZUORDNEN – Produkte

    private static func zuordnenProdukte(level: Int, produkte: [Produkt]) -> [Question] {
        var questions: [Question] = []
        let kategorien = Array(Set(produkte.map { $0.kategorie })).sorted()

        // Template A: Produkt → Kategorie zuordnen
        for produkt in produkte.shuffled().prefix(25) {
            let wrong = pickRandom(from: kategorien, not: produkt.kategorie, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Zu welcher Warenkunde-Kategorie geh\u{00F6}rt "\(produkt.name)"?",
                correct: produkt.kategorie,
                wrong: wrong,
                erklaerung:  \(produkt.name) geh\u{00F6}rt zur Kategorie \(produkt.kategorie)."
            ))
        }

        // Template B: "Welches Produkt gehört NICHT in die Kategorie X?"
        for kategorie in kategorien {
            let richtige = produkte.filter { $0.kategorie == kategorie }
            let falsche = produkte.filter { $0.kategorie != kategorie }
            guard richtige.count >= 3, let intruder = falsche.randomElement() else { continue }

            let korrektInKategorie = Array(richtige.shuffled().prefix(3)).map { $0.name }
            questions.append(makeQ(
                level: level,
                text: "Welches Produkt geh\u{00F6}rt NICHT in die Kategorie "\(kategorie)"?",
                correct: intruder.name,
                wrong: korrektInKategorie,
                erklaerung:  \(intruder.name) geh\u{00F6}rt zur Kategorie \(intruder.kategorie), nicht zu \(kategorie)."
            ))
        }

        return questions
    }

    // MARK: - Level 15: ZUORDNEN – Garmethoden & Saucen

    private static func zuordnenGarmethodenSaucen(level: Int, garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let hauptTypen = ["Feuchte Garmethode", "Trockene Garmethode", "Kombinierte Garmethode", "Kalte Garmethode", "Konservierung"]

        // Template A: Garmethode → Typ zuordnen
        for methode in garmethoden {
            let vereinfacht = simplifyGarmethodenTyp(methode.typ)
            var wrong = pickRandom(from: hauptTypen, not: vereinfacht, count: 3)
            if wrong.count < 3 {
                for extra in ["Chemische Garmethode", "Dampfgarmethode", "Induktionsgaren"] where wrong.count < 3 && extra != vereinfacht {
                    wrong.append(extra)
                }
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welcher Typ Garmethode ist "\(methode.name)"?",
                correct: vereinfacht,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(methode.name) ist eine \(methode.typ). Sie arbeitet mit \(methode.medium) bei \(methode.temperatur)."
            ))
        }

        // Template B: Sauce → Typ zuordnen
        let saucenTypen = Array(Set(saucen.map { $0.typ })).sorted()
        for sauce in saucen {
            let wrong = pickRandom(from: saucenTypen, not: sauce.typ, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welcher Typ Sauce ist "\(sauce.name)"?",
                correct: sauce.typ,
                wrong: wrong,
                erklaerung:  \(sauce.name) ist vom Typ "\(sauce.typ)". Basis: \(sauce.basis)."
            ))
        }

        // Template C: Beispiele → Garmethode zuordnen
        let alleMethoden = garmethoden.map { $0.name }
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.beispiele.isEmpty else { continue }
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "F\u{00FC}r welche Garmethode sind diese Beispiele typisch?\n"\(methode.beispiele)"",
                correct: methode.name,
                wrong: wrong,
                erklaerung: "Typische Beispiele f\u{00FC}r \(methode.name): \(methode.beispiele)."
            ))
        }

        return questions
    }

    // MARK: - Level 16: WISSEN – Produkte

    private static func wissenProdukte(level: Int, produkte: [Produkt]) -> [Question] {
        var questions: [Question] = []
        let alleLagerungen = Array(Set(produkte.map { $0.lagerung })).filter { !$0.isEmpty }

        // Template A: Lagerung
        for produkt in produkte.shuffled().prefix(15) {
            guard !produkt.lagerung.isEmpty else { continue }
            let wrong = pickRandom(from: alleLagerungen, not: produkt.lagerung, count: 3)
                .map { shortenText($0, maxLength: 80) }
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Wie wird "\(produkt.name)" richtig gelagert?",
                correct: shortenText(produkt.lagerung, maxLength: 80),
                wrong: wrong,
                erklaerung: "Lagerung von \(produkt.name): \(produkt.lagerung)
            ))
        }

        // Template B: Allergene
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }
        let alleAllergene = Array(Set(mitAllergenen.map { $0.allergene }))
        let extraAllergene = [
            "Gluten (Hauptallergen Nr. 1), "Erdnuss (Hauptallergen Nr. 5),
            "Soja (Hauptallergen Nr. 6), "Schalenfrüchte (Hauptallergen Nr. 8),
            "Lupine (Hauptallergen Nr. 12), "Sesam (Hauptallergen Nr. 11)
        ]
        for produkt in mitAllergenen.shuffled().prefix(10) {
            var wrong = pickRandom(from: alleAllergene, not: produkt.allergene, count: 3)
            for extra in extraAllergene where wrong.count < 3 && extra != produkt.allergene {
                wrong.append(extra)
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welches Allergen enth\u{00E4}lt "\(produkt.name)"?",
                correct: produkt.allergene,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(produkt.name) enth\u{00E4}lt: \(produkt.allergene). Die 14 Hauptallergene m\u{00FC}ssen laut EU-Verordnung gekennzeichnet werden."
            ))
        }

        // Template C: Nährwerte (kcal)
        for produkt in produkte.shuffled().prefix(10) {
            let korrekt =  \(produkt.naehrwerte.kcal) kcal pro 100g"
            let falscheWerte = [
                produkt.naehrwerte.kcal + 120,
                max(produkt.naehrwerte.kcal - 40, 5),
                produkt.naehrwerte.kcal + 250
            ].map {  \($0) kcal pro 100g" }

            questions.append(makeQ(
                level: level,
                text: "Wie viel Energie hat "\(produkt.name)" ungef\u{00E4}hr pro 100g?",
                correct: korrekt,
                wrong: falscheWerte,
                erklaerung:  \(produkt.name) hat \(produkt.naehrwerte.kcal) kcal, \(produkt.naehrwerte.fett)g Fett, \(produkt.naehrwerte.eiweiss)g Eiwei\u{00DF} und \(produkt.naehrwerte.kohlenhydrate)g Kohlenhydrate pro 100g."
            ))
        }

        return questions
    }

    // MARK: - Level 17: WISSEN – Garmethoden & Saucen

    private static func wissenGarmethodenSaucen(level: Int, garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleTemperaturen = garmethoden.map { $0.temperatur }
        let alleMedien = Array(Set(garmethoden.map { $0.medium }))
        let alleBasen = saucen.map { $0.basis }

        // Template A: Temperatur
        for methode in garmethoden {
            let wrong = pickRandom(from: alleTemperaturen, not: methode.temperatur, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Bei welcher Temperatur wird "\(methode.name)" durchgef\u{00FC}hrt?",
                correct: methode.temperatur,
                wrong: wrong,
                erklaerung:  \(methode.name) arbeitet bei \(methode.temperatur) mit \(methode.medium) als Garmedium."
            ))
        }

        // Template B: Garmedium
        for methode in garmethoden {
            let wrong = pickRandom(from: alleMedien, not: methode.medium, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welches Garmedium verwendet "\(methode.name)"?",
                correct: methode.medium,
                wrong: wrong,
                erklaerung:  \(methode.name) verwendet \(methode.medium) als Garmedium bei \(methode.temperatur)."
            ))
        }

        // Template C: Saucen-Basis
        for sauce in saucen {
            let wrong = pickRandom(from: alleBasen, not: sauce.basis, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Was ist die Basis von "\(sauce.name)"?",
                correct: sauce.basis,
                wrong: wrong,
                erklaerung:  \(sauce.name) (\(sauce.typ)) basiert auf: \(sauce.basis)."
            ))
        }

        // Template D: Saucen-Verwendung
        let alleVerwendungen = saucen.map { $0.verwendung }
        for sauce in saucen.shuffled().prefix(10) {
            let wrong = pickRandom(from: alleVerwendungen, not: sauce.verwendung, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Wof\u{00FC}r wird "\(sauce.name)" typischerweise verwendet?",
                correct: sauce.verwendung,
                wrong: wrong,
                erklaerung:  \(sauce.name) wird verwendet f\u{00FC}r: \(sauce.verwendung)."
            ))
        }

        return questions
    }

    // MARK: - Level 18: ANWENDEN – Praxis

    private static func anwendenPraxis(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let alleSaucen = saucen.map { $0.name }

        // Template A: Geeignet für → Garmethode wählen
        for methode in garmethoden {
            for geeignet in methode.geeignet_fuer.prefix(2) {
                let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
                guard wrong.count == 3 else { continue }

                questions.append(makeQ(
                    level: level,
                    text: "Du m\u{00F6}chtest "\(geeignet)" zubereiten. Welche Garmethode eignet sich besonders?",
                    correct: methode.name,
                    wrong: wrong,
                    erklaerung:  \(methode.name) eignet sich besonders f\u{00FC}r: \(methode.geeignet_fuer.joined(separator: ", ")). \(firstSentence(methode.praxistipps))
                ))
            }
        }

        // Template B: Allergen-Situation
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }
        let ohneAllergene = produkte.filter { $0.allergene.isEmpty && $0.kategorie != "Gew\u{00FC}rze" }

        let allergenGruppen: [(name: String, suchbegriff: String)] = [
            ("Milch", "Milch"),
            ("Fisch", "Fisch"),
            ("Krebstiere", "Krebstiere"),
            ("Weichtiere", "Weichtiere"),
            ("Sellerie", "Sellerie")
        ]

        for (allergenName, suchbegriff) in allergenGruppen {
            let betroffene = mitAllergenen.filter { $0.allergene.contains(suchbegriff) }
            guard let gefaehrlich = betroffene.randomElement() else { continue }
            let sichere = ohneAllergene.shuffled().prefix(3).map { $0.name }
            guard sichere.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Ein Gast hat eine \(allergenName)-Allergie. Welches Produkt darfst du NICHT verwenden?",
                correct: gefaehrlich.name,
                wrong: Array(sichere),
                erklaerung:  \(gefaehrlich.name) enth\u{00E4}lt \(gefaehrlich.allergene). Bei Allergien muss dies dem Gast mitgeteilt werden (EU-Verordnung 1169/2011)."
            ))
        }

        // Template C: Sauce für Verwendungszweck
        for sauce in saucen.shuffled().prefix(10) {
            let wrong = pickRandom(from: alleSaucen, not: sauce.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Du brauchst eine Sauce f\u{00FC}r "\(sauce.verwendung)". Welche w\u{00E4}hlst du?",
                correct: sauce.name,
                wrong: wrong,
                erklaerung:  \(sauce.name) wird klassisch verwendet f\u{00FC}r: \(sauce.verwendung)."
            ))
        }

        return questions
    }

    // MARK: - Level 19: ANWENDEN – Cross-Domain

    private static func anwendenCrossDomain(level: Int, garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleSaucen = saucen.map { $0.name }
        let alleMethoden = garmethoden.map { $0.name }

        // Template A: Ableitung → Grundlage erkennen
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundso\u{00DF}e") || $0.typ.contains("Mutterso\u{00DF}e") }
        for mutter in mutterSaucen {
            guard !mutter.ableitungen.isEmpty else { continue }
            var wrong = pickRandom(from: mutterSaucen.map { $0.name }, not: mutter.name, count: 3)
            for s in alleSaucen where wrong.count < 3 && s != mutter.name && !wrong.contains(s) {
                wrong.append(s)
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Die Ableitungen "\(mutter.ableitungen)" basieren auf welcher Mutterso\u{00DF}e?",
                correct: mutter.name,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(mutter.name) (\(mutter.typ)) ist die Basis f\u{00FC}r: \(mutter.ableitungen)."
            ))
        }

        // Template B: Praxistipp → Garmethode zuordnen
        for methode in garmethoden.shuffled().prefix(12) {
            guard !methode.praxistipps.isEmpty else { continue }
            let tipp = firstSentence(methode.praxistipps)
            guard !tipp.isEmpty else { continue }
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "F\u{00FC}r welche Garmethode gilt dieser Praxistipp?\n"\(tipp)"",
                correct: methode.name,
                wrong: wrong,
                erklaerung: "Praxistipp f\u{00FC}r \(methode.name): \(methode.praxistipps)
            ))
        }

        // Template C: Klassische Paarungen
        let klassiker: [(frage: String, antwort: String, erkl: String)] = [
            ("Welche Sauce ist der Klassiker zu wei\u{00DF}em Spargel?", "Hollandaise", "Hollandaise ist die klassische warme Emulsionssauce zu Spargel, Gem\u{00FC}se und Fisch."),
            ("Welche Sauce serviert man traditionell zu Eier Benedict?", "Hollandaise", "Eggs Benedict werden klassisch mit Hollandaise serviert."),
            ("Welche Sauce geh\u{00F6}rt klassisch zu gegrilltem Steak?", "B\u{00E9}arnaise", "B\u{00E9}arnaise ist die klassische Sauce zu gegrilltem oder kurzgebratenem Fleisch."),
            ("Welche Sauce ist die Basis f\u{00FC}r Lasagne?", "B\u{00E9}chamel", "Lasagne wird klassisch mit B\u{00E9}chamel und Bolognese geschichtet."),
            ("Aus welcher Sauce wird Sauce Mornay hergestellt?", "B\u{00E9}chamel", "Sauce Mornay = B\u{00E9}chamel + K\u{00E4}se (Gruy\u{00E8}re)."),
            ("Welcher Fond ist die Basis f\u{00FC}r eine Fischsuppe?", "Fumet de poisson (Fischfond), "Fischfond wird aus Fischkarkassen und Gem\u{00FC}se hergestellt. Maximal 30 Minuten kochen!")
        ]
        for klassik in klassiker {
            let wrong = pickRandom(from: alleSaucen, not: klassik.antwort, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: klassik.frage,
                correct: klassik.antwort,
                wrong: wrong,
                erklaerung: klassik.erkl
            ))
        }

        // Template D: Fond für bestimmte Sauce
        let fonds = saucen.filter { $0.typ == "Grundfond" }
        for fond in fonds {
            var wrong = pickRandom(from: fonds.map { $0.name }, not: fond.name, count: 3)
            for s in alleSaucen where wrong.count < 3 && s != fond.name && !wrong.contains(s) {
                wrong.append(s)
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Du brauchst einen Fond f\u{00FC}r "\(fond.verwendung)". Welchen verwendest du?",
                correct: fond.name,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(fond.name): \(fond.verwendung). Basis: \(fond.basis)."
            ))
        }

        return questions
    }

    // MARK: - Level 20: BEWERTEN

    private static func bewerten(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }

        // Template A: NICHT geeignet für
        for methode in garmethoden {
            for nichtGeeignet in methode.nicht_geeignet_fuer.prefix(2) {
                var distractors = garmethoden
                    .filter { $0.name != methode.name }
                    .map { $0.name }
                    .shuffled()
                distractors = Array(distractors.prefix(3))
                guard distractors.count == 3 else { continue }

                questions.append(makeQ(
                    level: level,
                    text: "Welche Garmethode ist NICHT geeignet f\u{00FC}r "\(nichtGeeignet)"?",
                    correct: methode.name,
                    wrong: distractors,
                    erklaerung:  \(methode.name) ist nicht geeignet f\u{00FC}r \(nichtGeeignet). \(methode.name) eignet sich f\u{00FC}r: \(methode.geeignet_fuer.prefix(3).joined(separator: ", "))."
                ))
            }
        }

        // Template B: Richtig/Falsch-Aussagen über Saucen
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundso\u{00DF}e") || $0.typ.contains("Mutterso\u{00DF}e") }
        for sauce in mutterSaucen {
            guard let andere = mutterSaucen.filter({ $0.name != sauce.name }).randomElement() else { continue }

            let falscheAussage =  \(sauce.name) basiert auf \(andere.basis)
            let richtigeAussage =  \(sauce.name) basiert auf \(sauce.basis)
            let andereRichtige1 =  \(andere.name) basiert auf \(andere.basis)

            let dritte = mutterSaucen.first { $0.name != sauce.name && $0.name != andere.name }
            let andereRichtige2 = dritte.map {  \($0.name) basiert auf \($0.basis) }
                ?? "Roux ist eine Mehlschwitze aus Butter und Mehl"

            questions.append(makeQ(
                level: level,
                text: "Welche Aussage \u{00FC}ber Saucen ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage, andereRichtige1, andereRichtige2],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(sauce.name) basiert auf \(sauce.basis)."
            ))
        }

        // Template C: Lagerung bewerten
        for produkt in produkte.shuffled().prefix(10) {
            guard !produkt.lagerung.isEmpty else { continue }
            let richtig = shortenText(produkt.lagerung, maxLength: 70)
            let andereLagerungen = Array(Set(
                produkte
                    .filter { $0.name != produkt.name && !$0.lagerung.isEmpty && $0.lagerung != produkt.lagerung }
                    .map { shortenText($0.lagerung, maxLength: 70) }
            ))
            let wrong = pickRandom(from: andereLagerungen, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Lagerungsempfehlung ist RICHTIG f\u{00FC}r "\(produkt.name)"?",
                correct: richtig,
                wrong: wrong,
                erklaerung: "Richtige Lagerung von \(produkt.name): \(produkt.lagerung)
            ))
        }

        // Template D: Garmethoden-Aussagen bewerten
        for methode in garmethoden.shuffled().prefix(8) {
            guard let andere = garmethoden.filter({ $0.name != methode.name }).randomElement() else { continue }

            let falscheAussage =  \(methode.name) arbeitet bei \(andere.temperatur) mit \(andere.medium)
            let richtigeAussage =  \(methode.name) arbeitet bei \(methode.temperatur) mit \(methode.medium)
            let andereRichtige =  \(andere.name) arbeitet bei \(andere.temperatur) mit \(andere.medium)

            let dritte = garmethoden.first { $0.name != methode.name && $0.name != andere.name }
            let dritteRichtige = dritte.map {  \($0.name) arbeitet bei \($0.temperatur) mit \($0.medium) }
                ?? "Beim Kochen gehen N\u{00E4}hrstoffe ins Wasser \u{00FC}ber"

            questions.append(makeQ(
                level: level,
                text: "Welche Aussage \u{00FC}ber Garmethoden ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage, andereRichtige, dritteRichtige],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(methode.name) arbeitet bei \(methode.temperatur) mit \(methode.medium)."
            ))
        }

        return questions
    }

    // MARK: - HALBJAHR 5: PRÜFUNGSVORBEREITUNG (Level 21-25)

    // MARK: - Level 21: PRÜFUNG MIX 1 – HACCP, Hygiene, Wareneingang

    private static func pruefungMix1(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }
        let alleLagerungen = Array(Set(produkte.map { $0.lagerung })).filter { !$0.isEmpty }

        // HACCP-kritische Temperaturen
        for methode in garmethoden.shuffled().prefix(8) {
            let wrong = pickRandom(from: garmethoden.map { $0.temperatur }, not: methode.temperatur, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "HACCP-Kontrolle: Bei welcher Temperatur muss  \(methode.name) durchgeführt werden?",
                correct: methode.temperatur,
                wrong: wrong,
                erklaerung: "Korrekte HACCP-Temperatur für \(methode.name): \(methode.temperatur). Temperaturkontrolle ist essentiell für Lebensmittelsicherheit."
            ))
        }

        // Wareneingang: Lagerung sofort erkennen
        for produkt in produkte.shuffled().prefix(12) {
            guard !produkt.lagerung.isEmpty else { continue }
            let wrong = pickRandom(from: alleLagerungen, not: produkt.lagerung, count: 3)
                .map { shortenText($0, maxLength: 70) }
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Wareneingang:  \(produkt.name) ist eingetroffen. Wie MUSS es sofort gelagert werden?",
                correct: shortenText(produkt.lagerung, maxLength: 70),
                wrong: wrong,
                erklaerung: "Sofortige Lagerung nach Wareneingang: \(produkt.lagerung). Kühlkette nicht unterbrechen!"
            ))
        }

        // Allergenkennzeichnung (Prüfungspflicht!)
        for produkt in mitAllergenen.shuffled().prefix(10) {
            let alleAllergene = Array(Set(mitAllergenen.map { $0.allergene }))
            let wrong = pickRandom(from: alleAllergene, not: produkt.allergene, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Allergenkennzeichnung für  \(produkt.name) – welches Allergen MUSS deklariert werden?",
                correct: produkt.allergene,
                wrong: wrong,
                erklaerung:  \(produkt.name) enthält: \(produkt.allergene). EU-Verordnung 1169/2011 verlangt Kennzeichnung der 14 Hauptallergene."
            ))
        }

        return questions
    }

    // MARK: - Level 22: PRÜFUNG MIX 2 – Garmethoden, Nährwerte, Allergene

    private static func pruefungMix2(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }

        // Garmedium erkennen (Prüfungsfrage-Typ)
        for methode in garmethoden {
            let wrong = pickRandom(from: garmethoden.map { $0.medium }, not: methode.medium, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welches Garmedium verwendet  \(methode.name)?",
                correct: methode.medium,
                wrong: wrong,
                erklaerung:  \(methode.name) verwendet \(methode.medium) bei \(methode.temperatur)."
            ))
        }

        // Nährwerte vergleichen (IHK-Niveau)
        let hochkalorisch = produkte.filter { $0.naehrwerte.kcal > 200 }.shuffled()
        let niedrigkalorisch = produkte.filter { $0.naehrwerte.kcal < 100 }.shuffled()

        for produkt in hochkalorisch.prefix(5) {
            let falsche = niedrigkalorisch.prefix(3).map {  \($0.name) (\($0.naehrwerte.kcal) kcal) }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welches Produkt hat die HÖCHSTEN Kalorien pro 100g?",
                correct:  \(produkt.name) (\(produkt.naehrwerte.kcal) kcal),
                wrong: Array(falsche),
                erklaerung:  \(produkt.name) hat \(produkt.naehrwerte.kcal) kcal/100g – deutlich mehr als die anderen."
            ))
        }

        // Mehrfach-Allergene (komplexe Prüfungsfrage)
        let allergenGruppen: [(name: String, suchbegriff: String)] = [
            ("Sellerie", "Sellerie"),
            ("Senf", "Senf"),
            ("Schwefeldioxid", "Schwefeldioxid")
        ]

        for (allergenName, suchbegriff) in allergenGruppen {
            let betroffene = mitAllergenen.filter { $0.allergene.contains(suchbegriff) }
            let nichtBetroffene = produkte.filter { !$0.allergene.contains(suchbegriff) }
            guard let gefaehrlich = betroffene.randomElement() else { continue }
            let sichere = nichtBetroffene.shuffled().prefix(3).map { $0.name }
            guard sichere.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Gast mit \(allergenName)-Allergie: Welches Produkt enthält das Allergen?",
                correct: gefaehrlich.name,
                wrong: Array(sichere),
                erklaerung:  \(gefaehrlich.name) enthält \(gefaehrlich.allergene). Allergenkennzeichnung ist Pflicht!"
            ))
        }

        // Geeignet für → Garmethode (Prüfungs-Standard)
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.geeignet_fuer.isEmpty else { continue }
            let geeignet = methode.geeignet_fuer.randomElement() ?? methode.geeignet_fuer[0]
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Für  \(geeignet) – welche Garmethode ist optimal?",
                correct: methode.name,
                wrong: wrong,
                erklaerung:  \(methode.name) ist besonders geeignet für: \(methode.geeignet_fuer.joined(separator: ", "))."
            ))
        }

        return questions
    }

    // MARK: - Level 23: PRÜFUNG MIX 3 – Saucen, Fonds, klassische Küche

    private static func pruefungMix3(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleSaucen = saucen.map { $0.name }
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundsoße") || $0.typ.contains("Muttersoße") }

        // Muttersaucen-Basis (Prüfungs-Klassiker)
        for sauce in mutterSaucen {
            let wrong = pickRandom(from: saucen.map { $0.basis }, not: sauce.basis, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Was ist die klassische Basis von  \(sauce.name)?",
                correct: sauce.basis,
                wrong: wrong,
                erklaerung:  \(sauce.name) basiert auf: \(sauce.basis). Muttersaucen sind die Grundlage der klassischen Küche."
            ))
        }

        // Ableitungen erkennen (IHK-Niveau)
        for mutter in mutterSaucen {
            guard !mutter.ableitungen.isEmpty else { continue }
            let ableitungListe = mutter.ableitungen.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
            guard let ableitung = ableitungListe.randomElement() else { continue }

            var wrong = pickRandom(from: mutterSaucen.map { $0.name }, not: mutter.name, count: 3)
            for s in alleSaucen where wrong.count < 3 && s != mutter.name && !wrong.contains(s) {
                wrong.append(s)
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: " \(ableitung) ist eine Ableitung von welcher Muttersoße?",
                correct: mutter.name,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(ableitung) leitet sich ab von \(mutter.name). Ableitungen: \(mutter.ableitungen)."
            ))
        }

        // Fonds-Verwendung (Prüfungs-Standard)
        let fonds = saucen.filter { $0.typ == "Grundfond" }
        for fond in fonds {
            let wrong = pickRandom(from: saucen.map { $0.verwendung }, not: fond.verwendung, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Wofür wird  \(fond.name) klassisch verwendet?",
                correct: fond.verwendung,
                wrong: wrong,
                erklaerung:  \(fond.name) wird verwendet für: \(fond.verwendung)."
            ))
        }

        // Sauce für Verwendung (komplexer)
        for sauce in saucen.shuffled().prefix(15) {
            let wrong = pickRandom(from: alleSaucen, not: sauce.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Sauce passt klassisch zu  \(sauce.verwendung)?",
                correct: sauce.name,
                wrong: wrong,
                erklaerung:  \(sauce.name) ist die klassische Wahl für: \(sauce.verwendung)."
            ))
        }

        return questions
    }

    // MARK: - Level 24: PRÜFUNG MIX 4 – Komplexe Praxissituationen

    private static func pruefungMix4(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }

        // Multi-Allergen-Situation (sehr IHK-typisch)
        let allergenKombis: [(name: String, suchbegriffe: [String])] = [
            ("Milch UND Ei", ["Milch", "Ei"]),
            ("Fisch UND Sellerie", ["Fisch", "Sellerie"]),
            ("Gluten UND Milch", ["Gluten", "Milch"])
        ]

        for (kombiName, suchbegriffe) in allergenKombis {
            let betroffene = mitAllergenen.filter { produkt in
                suchbegriffe.allSatisfy { produkt.allergene.contains($0) }
            }
            let nichtBetroffene = produkte.filter { produkt in
                !suchbegriffe.contains { produkt.allergene.contains($0) }
            }
            guard let gefaehrlich = betroffene.randomElement() else { continue }
            let sichere = nichtBetroffene.shuffled().prefix(3).map { $0.name }
            guard sichere.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Gast mit \(kombiName)-Allergie: Welches Produkt ist NICHT geeignet?",
                correct: gefaehrlich.name,
                wrong: Array(sichere),
                erklaerung:  \(gefaehrlich.name) enthält: \(gefaehrlich.allergene). Bei mehreren Allergien besonders vorsichtig sein!"
            ))
        }

        // NICHT geeignet für (Prüfungsfalle!)
        for methode in garmethoden.shuffled().prefix(12) {
            guard !methode.nicht_geeignet_fuer.isEmpty else { continue }
            let nichtGeeignet = methode.nicht_geeignet_fuer.randomElement() ?? methode.nicht_geeignet_fuer[0]
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Garmethode ist NICHT geeignet für  \(nichtGeeignet)?",
                correct: methode.name,
                wrong: wrong,
                erklaerung:  \(methode.name) ist nicht geeignet für \(nichtGeeignet). Stattdessen verwenden: \(methode.geeignet_fuer.prefix(2).joined(separator: ", "))."
            ))
        }

        // Praxistipp → Situation (anspruchsvoll)
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.praxistipps.isEmpty else { continue }
            let tipp = firstSentence(methode.praxistipps)
            guard !tipp.isEmpty else { continue }
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Praxissituation:  \(tipp) – Welche Garmethode wird beschrieben?",
                correct: methode.name,
                wrong: wrong,
                erklaerung: "Praxistipp für \(methode.name): \(methode.praxistipps)
            ))
        }

        // Kategorie-Fehler erkennen (BEWERTEN-Niveau)
        let kategorien = Array(Set(produkte.map { $0.kategorie })).sorted()
        for kategorie in kategorien {
            let richtige = produkte.filter { $0.kategorie == kategorie }
            let falsche = produkte.filter { $0.kategorie != kategorie }
            guard richtige.count >= 3, let intruder = falsche.randomElement() else { continue }

            let korrektInKategorie = Array(richtige.shuffled().prefix(3)).map { $0.name }
            questions.append(makeQ(
                level: level,
                text: "Fehler beim Sortieren: Welches Produkt gehört NICHT zu  \(kategorie)?",
                correct: intruder.name,
                wrong: korrektInKategorie,
                erklaerung:  \(intruder.name) gehört zu \(intruder.kategorie), nicht zu \(kategorie)."
            ))
        }

        return questions
    }

    // MARK: - Level 25: PRÜFUNG MIX 5 – Lagerhaltung, Arbeitssicherheit, Mix

    private static func pruefungMix5(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleLagerungen = Array(Set(produkte.map { $0.lagerung })).filter { !$0.isEmpty }
        let alleMethoden = garmethoden.map { $0.name }

        // Lagerhaltung RICHTIG/FALSCH (Prüfungs-Klassiker)
        for produkt in produkte.shuffled().prefix(15) {
            guard !produkt.lagerung.isEmpty else { continue }
            let richtig = shortenText(produkt.lagerung, maxLength: 70)
            let andereLagerungen = Array(Set(
                produkte
                    .filter { $0.name != produkt.name && !$0.lagerung.isEmpty && $0.lagerung != produkt.lagerung }
                    .map { shortenText($0.lagerung, maxLength: 70) }
            ))
            let wrong = pickRandom(from: andereLagerungen, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welche Lagerung ist RICHTIG für  \(produkt.name)?",
                correct: richtig,
                wrong: wrong,
                erklaerung: "Richtige Lagerung: \(produkt.lagerung)
            ))
        }

        // Typ-Zuordnung Garmethoden (komplett durchmischt)
        let hauptTypen = ["Feuchte Garmethode", "Trockene Garmethode", "Kombinierte Garmethode"]
        for methode in garmethoden.shuffled().prefix(12) {
            let vereinfacht = simplifyGarmethodenTyp(methode.typ)
            var wrong = pickRandom(from: hauptTypen, not: vereinfacht, count: 3)
            if wrong.count < 3 {
                for extra in ["Chemische Garmethode", "Dampfgarmethode"] where wrong.count < 3 && extra != vereinfacht {
                    wrong.append(extra)
                }
            }
            guard wrong.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Zu welchem Typ gehört  \(methode.name)?",
                correct: vereinfacht,
                wrong: Array(wrong.prefix(3)),
                erklaerung:  \(methode.name) ist eine \(methode.typ)."
            ))
        }

        // Beispiele → Garmethode (IHK-Niveau)
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.beispiele.isEmpty else { continue }
            let wrong = pickRandom(from: alleMethoden, not: methode.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Typische Beispiele:  \(methode.beispiele) – Welche Garmethode?",
                correct: methode.name,
                wrong: wrong,
                erklaerung: "Beispiele für \(methode.name): \(methode.beispiele)."
            ))
        }

        // Sauce-Typ zuordnen
        let saucenTypen = Array(Set(saucen.map { $0.typ })).sorted()
        for sauce in saucen.shuffled().prefix(12) {
            let wrong = pickRandom(from: saucenTypen, not: sauce.typ, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "Welcher Typ ist  \(sauce.name)?",
                correct: sauce.typ,
                wrong: wrong,
                erklaerung:  \(sauce.name) ist vom Typ  \(sauce.typ). Basis: \(sauce.basis)."
            ))
        }

        return questions
    }

    // MARK: - HALBJAHR 6: MEISTERKLASSE (Level 26-30)

    // MARK: - Level 26: EXPERTE WISSEN – Tiefes Fachwissen

    private static func experteWissen(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }
        let alleAllergene = Array(Set(mitAllergenen.map { $0.allergene }))

        // Nährwerte GENAU (Experten-Niveau)
        for produkt in produkte.shuffled().prefix(15) {
            let korrekt =  \(produkt.naehrwerte.kcal) kcal, \(produkt.naehrwerte.fett)g Fett, \(produkt.naehrwerte.eiweiss)g Eiweiß"
            let falscheWerte = [
                 \(produkt.naehrwerte.kcal + 50) kcal, \(produkt.naehrwerte.fett + 2)g Fett, \(produkt.naehrwerte.eiweiss)g Eiweiß",
                 \(produkt.naehrwerte.kcal) kcal, \(max(produkt.naehrwerte.fett - 3, 0))g Fett, \(produkt.naehrwerte.eiweiss + 5)g Eiweiß",
                 \(produkt.naehrwerte.kcal - 30) kcal, \(produkt.naehrwerte.fett)g Fett, \(max(produkt.naehrwerte.eiweiss - 2, 0))g Eiweiß"
            ]

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Nährwerte von  \(produkt.name) pro 100g?",
                correct: korrekt,
                wrong: falscheWerte,
                erklaerung:  \(produkt.name): \(produkt.naehrwerte.kcal) kcal, \(produkt.naehrwerte.fett)g Fett, \(produkt.naehrwerte.eiweiss)g Eiweiß, \(produkt.naehrwerte.kohlenhydrate)g Kohlenhydrate."
            ))
        }

        // Allergene ALLE kennen (Meister-Niveau)
        for produkt in mitAllergenen.shuffled().prefix(10) {
            let wrong = pickRandom(from: alleAllergene, not: produkt.allergene, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Welches Allergen enthält  \(produkt.name) exakt?",
                correct: produkt.allergene,
                wrong: wrong,
                erklaerung:  \(produkt.name) enthält: \(produkt.allergene). 14 Hauptallergene müssen gekennzeichnet werden."
            ))
        }

        // Temperatur + Medium EXAKT (kein Fehler erlaubt)
        for methode in garmethoden {
            let korrekt =  \(methode.temperatur) / \(methode.medium)
            let falsche = garmethoden.filter { $0.name != methode.name }.shuffled().prefix(3).map {
                 \($0.temperatur) / \($0.medium)
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Temperatur und Medium für  \(methode.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(methode.name): \(methode.temperatur) mit \(methode.medium)."
            ))
        }

        // Sauce-Basis UND Ableitungen (komplex)
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundsoße") || $0.typ.contains("Muttersoße") }
        for sauce in mutterSaucen {
            guard !sauce.ableitungen.isEmpty else { continue }
            let korrekt =  \(sauce.basis) → \(sauce.ableitungen)
            let falsche = mutterSaucen.filter { $0.name != sauce.name }.shuffled().prefix(3).map {
                 \($0.basis) → \($0.ableitungen)
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Basis und Ableitungen von  \(sauce.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(sauce.name): Basis \(sauce.basis), Ableitungen: \(sauce.ableitungen)."
            ))
        }

        return questions
    }

    // MARK: - Level 27: EXPERTE ANWENDEN – Komplexe Praxisszenarien

    private static func experteAnwenden(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let alleSaucen = saucen.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }

        // Komplexe Allergiker-Situation (3+ Allergene)
        let komplexeAllergiker: [(name: String, suchbegriffe: [String])] = [
            ("Milch, Ei UND Gluten", ["Milch", "Ei", "Gluten"]),
            ("Fisch, Krebstiere UND Sellerie", ["Fisch", "Krebstiere", "Sellerie"])
        ]

        for (kombiName, suchbegriffe) in komplexeAllergiker {
            let sicher = produkte.filter { produkt in
                !suchbegriffe.contains { produkt.allergene.contains($0) }
            }
            let unsicher = mitAllergenen.filter { produkt in
                suchbegriffe.contains { produkt.allergene.contains($0) }
            }
            guard let safe = sicher.randomElement() else { continue }
            let wrong = unsicher.shuffled().prefix(3).map { $0.name }
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Gast mit \(kombiName)-Allergie – welches Produkt ist SICHER?",
                correct: safe.name,
                wrong: Array(wrong),
                erklaerung:  \(safe.name) ist sicher (keine Allergene). Bei mehreren Allergien ist extreme Vorsicht geboten!"
            ))
        }

        // Geeignet + NICHT geeignet kombiniert (sehr schwer)
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.geeignet_fuer.isEmpty && !methode.nicht_geeignet_fuer.isEmpty else { continue }
            let geeignet = methode.geeignet_fuer.randomElement() ?? methode.geeignet_fuer[0]
            let nichtGeeignet = methode.nicht_geeignet_fuer.randomElement() ?? methode.nicht_geeignet_fuer[0]

            let korrekt = "Geeignet für \(geeignet), NICHT für \(nichtGeeignet)
            let falsche = garmethoden.filter { $0.name != methode.name }.shuffled().prefix(3).map {
                let g = $0.geeignet_fuer.randomElement() ?? "Fleisch"
                let n = $0.nicht_geeignet_fuer.randomElement() ?? "Fisch"
                return "Geeignet für \(g), NICHT für \(n)
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Für was ist  \(methode.name) geeignet bzw. NICHT geeignet?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(methode.name): Geeignet für \(methode.geeignet_fuer.joined(separator: ", ")). NICHT geeignet für \(methode.nicht_geeignet_fuer.joined(separator: ", "))."
            ))
        }

        // Praxistipp + Temperatur kombiniert
        for methode in garmethoden.shuffled().prefix(10) {
            guard !methode.praxistipps.isEmpty else { continue }
            let tipp = firstSentence(methode.praxistipps)
            guard !tipp.isEmpty else { continue }

            let korrekt =  \(methode.temperatur) – \(tipp)
            let falsche = garmethoden.filter { $0.name != methode.name && !$0.praxistipps.isEmpty }.shuffled().prefix(3).map {
                 \($0.temperatur) – \(firstSentence($0.praxistipps))
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Temperatur und Praxistipp für  \(methode.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(methode.name) bei \(methode.temperatur). Praxistipp: \(methode.praxistipps)
            ))
        }

        // Sauce für komplexe Verwendung
        for sauce in saucen.shuffled().prefix(15) {
            let wrong = pickRandom(from: alleSaucen, not: sauce.name, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Perfekte Sauce für  \(sauce.verwendung)?",
                correct: sauce.name,
                wrong: wrong,
                erklaerung:  \(sauce.name) ist die klassische Wahl für \(sauce.verwendung). Basis: \(sauce.basis)."
            ))
        }

        return questions
    }

    // MARK: - Level 28: EXPERTE BEWERTEN – Kritische Analyse

    private static func experteBewerten(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundsoße") || $0.typ.contains("Muttersoße") }

        // Komplexe FALSCHE Aussagen über Saucen
        for sauce in mutterSaucen {
            guard let andere = mutterSaucen.filter({ $0.name != sauce.name }).randomElement() else { continue }
            guard let dritte = mutterSaucen.filter({ $0.name != sauce.name && $0.name != andere.name }).randomElement() else { continue }

            let falscheAussage =  \(sauce.name) basiert auf \(andere.basis) und wird verwendet für \(dritte.verwendung)
            let richtigeAussage1 =  \(sauce.name) basiert auf \(sauce.basis) und wird verwendet für \(sauce.verwendung)
            let richtigeAussage2 =  \(andere.name) basiert auf \(andere.basis) und wird verwendet für \(andere.verwendung)
            let richtigeAussage3 =  \(dritte.name) basiert auf \(dritte.basis)

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Welche Aussage ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage1, richtigeAussage2, richtigeAussage3],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(sauce.name) basiert auf \(sauce.basis)."
            ))
        }

        // Garmethoden: Medium + Temperatur FALSCH kombiniert
        for methode in garmethoden.shuffled().prefix(12) {
            guard let andere = garmethoden.filter({ $0.name != methode.name }).randomElement() else { continue }
            guard let dritte = garmethoden.filter({ $0.name != methode.name && $0.name != andere.name }).randomElement() else { continue }

            let falscheAussage =  \(methode.name) arbeitet bei \(andere.temperatur) mit \(dritte.medium)
            let richtigeAussage1 =  \(methode.name) arbeitet bei \(methode.temperatur) mit \(methode.medium)
            let richtigeAussage2 =  \(andere.name) arbeitet bei \(andere.temperatur) mit \(andere.medium)
            let richtigeAussage3 =  \(dritte.name) arbeitet bei \(dritte.temperatur)

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Welche Aussage über Garmethoden ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage1, richtigeAussage2, richtigeAussage3],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(methode.name) arbeitet bei \(methode.temperatur) mit \(methode.medium)."
            ))
        }

        // Produkt: Lagerung + Allergen FALSCH kombiniert
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty && !$0.lagerung.isEmpty }
        for produkt in mitAllergenen.shuffled().prefix(10) {
            guard let anderes = mitAllergenen.filter({ $0.name != produkt.name }).randomElement() else { continue }

            let falscheAussage =  \(produkt.name) enthält \(anderes.allergene) und lagert bei \(shortenText(anderes.lagerung, maxLength: 40))
            let richtigeAussage1 =  \(produkt.name) enthält \(produkt.allergene) und lagert bei \(shortenText(produkt.lagerung, maxLength: 40))
            let richtigeAussage2 =  \(anderes.name) enthält \(anderes.allergene)
            let richtigeAussage3 =  \(produkt.name) enthält \(produkt.allergene)

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Welche Aussage ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage1, richtigeAussage2, richtigeAussage3],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(produkt.name) enthält \(produkt.allergene) und lagert: \(produkt.lagerung)."
            ))
        }

        // Kategorie-Zuordnung FALSCH
        let kategorien = Array(Set(produkte.map { $0.kategorie })).sorted()
        for produkt in produkte.shuffled().prefix(12) {
            guard let falscheKat = kategorien.filter({ $0 != produkt.kategorie }).randomElement() else { continue }
            guard let anderes = produkte.filter({ $0.kategorie == produkt.kategorie && $0.name != produkt.name }).randomElement() else { continue }

            let falscheAussage =  \(produkt.name) gehört zur Kategorie \(falscheKat)
            let richtigeAussage1 =  \(produkt.name) gehört zur Kategorie \(produkt.kategorie)
            let richtigeAussage2 =  \(anderes.name) gehört zur Kategorie \(produkt.kategorie)
            let richtigeAussage3 =  \(produkt.name) ist ein Lebensmittel"

            questions.append(makeQ(
                level: level,
                text: "EXPERTE: Welche Aussage über Kategorien ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage1, richtigeAussage2, richtigeAussage3],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(produkt.name) gehört zur Kategorie \(produkt.kategorie)."
            ))
        }

        return questions
    }

    // MARK: - Level 29: SYNTHETISIEREN – Kreative Problemlösung

    private static func synthetisieren(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let alleSaucen = saucen.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }

        // Menü-Planung: Welche Garmethode für 3-Gänge-Menü?
        let menuSzenarien: [(beschreibung: String, methode: String, erklaerung: String)] = [
            ("3-Gänge-Menü mit Fisch als Hauptgang", "Pochieren", "Pochieren ist schonend für Fisch und erhält Aroma und Textur."),
            ("Vegetarisches Menü mit knackigem Gemüse", "Dämpfen", "Dämpfen erhält Vitamine, Farbe und Biss von Gemüse."),
            ("Festliches Fleischgericht mit Kruste", "Braten", "Braten erzeugt die gewünschte Kruste durch Maillard-Reaktion."),
            ("Asiatisches Menü mit schneller Zubereitung", "Pfannenrühren (Stir-Fry), "Pfannenrühren ist perfekt für schnelle, aromatische asiatische Gerichte.")
        ]

        for szenario in menuSzenarien {
            let wrong = pickRandom(from: alleMethoden, not: szenario.methode, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Du planst ein \(szenario.beschreibung). Welche Garmethode ist optimal?",
                correct: szenario.methode,
                wrong: wrong,
                erklaerung: szenario.erklaerung
            ))
        }

        // Komplexe Allergen-Kombination + Ersatzprodukt
        let allergenErsatz: [(allergen: String, suchbegriff: String, ersatz: String)] = [
            ("Milch", "Milch", "Mandelmilch oder Hafermilch"),
            ("Gluten", "Gluten", "Reismehl oder Buchweizenmehl"),
            ("Ei", "Ei", "Aquafaba oder Leinsamengel")
        ]

        for (allergenName, suchbegriff, ersatz) in allergenErsatz {
            let betroffene = mitAllergenen.filter { $0.allergene.contains(suchbegriff) }
            guard let produkt = betroffene.randomElement() else { continue }

            let korrekt = "Ersetze \(produkt.name) durch \(ersatz)
            let falscheErsaetze = [
                "Ersetze \(produkt.name) durch normales Mehl",
                "Ersetze \(produkt.name) durch Kuhmilch",
                "Ersetze \(produkt.name) durch Hühnerei"
            ]

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Gast mit \(allergenName)-Allergie – wie ersetzt du  \(produkt.name)?",
                correct: korrekt,
                wrong: falscheErsaetze,
                erklaerung: "Bei \(allergenName)-Allergie: \(ersatz) ist eine sichere Alternative zu \(produkt.name)."
            ))
        }

        // Sauce-Kombination: Welche Muttersauce für neue Kreation?
        let sauceKreationen: [(beschreibung: String, mutter: String, erklaerung: String)] = [
            ("Leichte Sauce zu gedämpftem Fisch", "Velouté", "Velouté (heller Fond) ist perfekt für Fisch – leicht und aromatisch."),
            ("Cremige Sauce zu Pasta-Gratin", "Béchamel", "Béchamel ist die Basis für Gratins und cremige Pasta-Saucen."),
            ("Aromatische Sauce zu gegrilltem Steak", "Espagnole", "Espagnole (dunkler Fond) ist die Basis für kräftige Fleischsaucen."),
            ("Buttrige Sauce zu Spargel", "Hollandaise", "Hollandaise ist die klassische Emulsionssauce zu Spargel.")
        ]

        for kreation in sauceKreationen {
            let wrong = pickRandom(from: alleSaucen, not: kreation.mutter, count: 3)
            guard wrong.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Du kreierst eine \(kreation.beschreibung). Welche Muttersauce ist die Basis?",
                correct: kreation.mutter,
                wrong: wrong,
                erklaerung: kreation.erklaerung
            ))
        }

        // Temperatur-Optimierung: Welche Temperatur für welches Ergebnis?
        for methode in garmethoden.shuffled().prefix(10) {
            let korrekt =  \(methode.temperatur) → \(methode.medium)
            let falsche = garmethoden.filter { $0.name != methode.name }.shuffled().prefix(3).map {
                 \($0.temperatur) → \($0.medium)
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Optimale Temperatur und Medium für  \(methode.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(methode.name) arbeitet optimal bei \(methode.temperatur) mit \(methode.medium). Praxistipp: \(firstSentence(methode.praxistipps))
            ))
        }

        return questions
    }

    // MARK: - Level 30: MEISTER – Härteste Fragen, alles kombiniert

    private static func meisterLevel(level: Int, produkte: [Produkt], garmethoden: [Garmethode], saucen: [Sauce]) -> [Question] {
        var questions: [Question] = []
        let alleMethoden = garmethoden.map { $0.name }
        let alleSaucen = saucen.map { $0.name }
        let mitAllergenen = produkte.filter { !$0.allergene.isEmpty }
        let mutterSaucen = saucen.filter { $0.typ.contains("Grundsoße") || $0.typ.contains("Muttersoße") }

        // MEISTER-Frage: Produkt + Garmethode + Sauce kombiniert
        for methode in garmethoden.shuffled().prefix(8) {
            guard !methode.geeignet_fuer.isEmpty else { continue }
            let geeignet = methode.geeignet_fuer.randomElement() ?? methode.geeignet_fuer[0]
            guard let passendeSauce = saucen.filter({ $0.verwendung.contains(geeignet) || $0.verwendung.contains("Fleisch") }).randomElement() else { continue }

            let korrekt =  \(methode.name) bei \(methode.temperatur) + \(passendeSauce.name)
            let falsche = garmethoden.filter { $0.name != methode.name }.shuffled().prefix(3).map {
                guard let andereSauce = saucen.randomElement() else { return "" }
                return  \($0.name) bei \($0.temperatur) + \(andereSauce.name)
            }.filter { !$0.isEmpty }
            guard falsche.count >= 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Optimale Zubereitung für  \(geeignet)? (Garmethode + Sauce),
                correct: korrekt,
                wrong: Array(falsche.prefix(3)),
                erklaerung:  \(methode.name) bei \(methode.temperatur) eignet sich perfekt für \(geeignet). Klassische Sauce: \(passendeSauce.name)."
            ))
        }

        // MEISTER: Mehrfach-Allergen + Nährwerte
        for produkt in mitAllergenen.shuffled().prefix(8) {
            let korrekt =  \(produkt.allergene) / \(produkt.naehrwerte.kcal) kcal / \(shortenText(produkt.lagerung, maxLength: 30))
            let falsche = mitAllergenen.filter { $0.name != produkt.name }.shuffled().prefix(3).map {
                 \($0.allergene) / \($0.naehrwerte.kcal) kcal / \(shortenText($0.lagerung, maxLength: 30))
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Allergene, Kalorien UND Lagerung von  \(produkt.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(produkt.name): Allergene: \(produkt.allergene), \(produkt.naehrwerte.kcal) kcal/100g, Lagerung: \(produkt.lagerung)."
            ))
        }

        // MEISTER: Muttersauce + Ableitungen + Verwendung
        for sauce in mutterSaucen.shuffled().prefix(8) {
            guard !sauce.ableitungen.isEmpty else { continue }
            let korrekt =  \(sauce.basis) → \(sauce.ableitungen) → \(sauce.verwendung)
            let falsche = mutterSaucen.filter { $0.name != sauce.name && !$0.ableitungen.isEmpty }.shuffled().prefix(3).map {
                 \($0.basis) → \($0.ableitungen) → \($0.verwendung)
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Basis, Ableitungen UND Verwendung von  \(sauce.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(sauce.name): Basis \(sauce.basis), Ableitungen: \(sauce.ableitungen), Verwendung: \(sauce.verwendung)."
            ))
        }

        // MEISTER: Garmethode komplett (Typ + Temperatur + Medium + Praxistipp)
        for methode in garmethoden.shuffled().prefix(8) {
            guard !methode.praxistipps.isEmpty else { continue }
            let tipp = firstSentence(methode.praxistipps)
            guard !tipp.isEmpty else { continue }

            let korrekt =  \(simplifyGarmethodenTyp(methode.typ)) / \(methode.temperatur) / \(methode.medium) / \(tipp)
            let falsche = garmethoden.filter { $0.name != methode.name && !$0.praxistipps.isEmpty }.shuffled().prefix(3).map {
                 \(simplifyGarmethodenTyp($0.typ)) / \($0.temperatur) / \($0.medium) / \(firstSentence($0.praxistipps))
            }
            guard falsche.count == 3 else { continue }

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Typ, Temperatur, Medium UND Praxistipp für  \(methode.name)?",
                correct: korrekt,
                wrong: Array(falsche),
                erklaerung:  \(methode.name): \(methode.typ), \(methode.temperatur), \(methode.medium). Praxistipp: \(methode.praxistipps)
            ))
        }

        // MEISTER: Komplexe FALSCHE Aussage (3 Elemente kombiniert)
        for produkt in produkte.shuffled().prefix(8) {
            guard !produkt.allergene.isEmpty && !produkt.lagerung.isEmpty else { continue }
            guard let anderes = produkte.filter({ $0.name != produkt.name && !$0.allergene.isEmpty }).randomElement() else { continue }
            guard let drittes = produkte.filter({ $0.name != produkt.name && $0.name != anderes.name }).randomElement() else { continue }

            let falscheAussage =  \(produkt.name) (\(produkt.kategorie)) enthält \(anderes.allergene) und hat \(drittes.naehrwerte.kcal) kcal"
            let richtigeAussage1 =  \(produkt.name) (\(produkt.kategorie)) enthält \(produkt.allergene) und hat \(produkt.naehrwerte.kcal) kcal"
            let richtigeAussage2 =  \(anderes.name) enthält \(anderes.allergene)
            let richtigeAussage3 =  \(produkt.name) gehört zur Kategorie \(produkt.kategorie)

            questions.append(makeQ(
                level: level,
                text: "MEISTER: Welche komplexe Aussage ist FALSCH?",
                correct: falscheAussage,
                wrong: [richtigeAussage1, richtigeAussage2, richtigeAussage3],
                erklaerung: "Falsch: \(falscheAussage). Richtig: \(produkt.name) enthält \(produkt.allergene) und hat \(produkt.naehrwerte.kcal) kcal."
            ))
        }

        return questions
    }

    // MARK: - Hilfsfunktionen

    /// Erstellt ein Question-Objekt mit der richtigen Antwort an Index 0
    private static func makeQ(level: Int, text: String, correct: String, wrong: [String], erklaerung: String) -> Question {
        Question(
            level: level,
            text: text,
            answers: [correct] + Array(wrong.prefix(3)),
            correctIndex: 0,
            erklaerung: erklaerung
        )
    }

    /// Wählt N zufällige, einzigartige Einträge, die nicht dem ausgeschlossenen Wert entsprechen
    private static func pickRandom(from pool: [String], not excluded: String, count: Int = 3) -> [String] {
        let unique = Array(Set(pool.filter { $0 != excluded }))
        return Array(unique.shuffled().prefix(count))
    }

    /// Wählt N zufällige, einzigartige Einträge aus dem Array
    private static func pickRandom(from pool: [String], count: Int = 3) -> [String] {
        let unique = Array(Set(pool))
        return Array(unique.shuffled().prefix(count))
    }

    /// Extrahiert den ersten vollständigen Satz aus einem Text (mind. 20 Zeichen)
    private static func firstSentence(_ text: String) -> String {
        var searchStart = text.startIndex
        while searchStart < text.endIndex {
            guard let dotRange = text[searchStart...].range(of: ".") else { break }
            let dotIndex = dotRange.lowerBound
            let distance = text.distance(from: text.startIndex, to: dotIndex)

            if distance >= 20 {
                return String(text[text.startIndex...dotIndex])
            }
            searchStart = text.index(after: dotIndex)
        }

        if text.count > 100 {
            let index = text.index(text.startIndex, offsetBy: 100)
            return String(text[..<index]) + "\u{2026}"
        }
        return text
    }

    /// Kürzt Text auf maximale Länge
    private static func shortenText(_ text: String, maxLength: Int) -> String {
        if text.count <= maxLength { return text }
        let index = text.index(text.startIndex, offsetBy: maxLength)
        return String(text[..<index]) + "\u{2026}"
    }

    /// Vereinfacht Garmethoden-Typ für Quiz-Antworten
    private static func simplifyGarmethodenTyp(_ typ: String) -> String {
        if typ.contains("Feuchte") || typ.contains("vakuumiert") { return "Feuchte Garmethode" }
        if typ.contains("Trockene") { return "Trockene Garmethode" }
        if typ.contains("Kombiniert") { return "Kombinierte Garmethode" }
        if typ.contains("Kalte") || typ.contains("Marinieren") { return "Kalte Garmethode" }
        if typ.contains("Konservierung") { return "Konservierung" }
        return typ
    }
}
