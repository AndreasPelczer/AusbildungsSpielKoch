//
//  CSVQuestionLoader.swift
//  AusbildungsSpielKoch
//
//  CSV-Parser für handkuratierte Fragen (Level 21-30)
//

import Foundation

class CSVQuestionLoader {

    /// Lädt Fragen aus CSV-Datei
    static func loadFromCSV(filename: String) -> [Question] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "csv") else {
            #if DEBUG
            print("CSV-Datei nicht gefunden: \(filename).csv")
            #endif
            return []
        }

        guard let csvString = try? String(contentsOf: url, encoding: .utf8) else {
            #if DEBUG
            print("CSV konnte nicht gelesen werden: \(filename).csv")
            #endif
            return []
        }

        return parseCSV(csvString)
    }

    /// Parst CSV-String zu Question-Array
    private static func parseCSV(_ csvString: String) -> [Question] {
        var questions: [Question] = []
        let lines = csvString.components(separatedBy: .newlines)

        // Erste Zeile überspringen (Header)
        for (index, line) in lines.enumerated() {
            guard index > 0, !line.isEmpty else { continue }

            // CSV parsen (mit Anführungszeichen-Unterstützung)
            let fields = parseCSVLine(line)

            // Format: Level,Nr,Frage,A,B,C,D,Richtig,Kategorie
            guard fields.count >= 9 else {
                #if DEBUG
                print("Ungültige CSV-Zeile (zu wenige Felder): \(line)")
                #endif
                continue
            }

            guard let level = Int(fields[0]) else {
                #if DEBUG
                print("Ungültiges Level: \(fields[0])")
                #endif
                continue
            }

            let frage = fields[2]
            let answerA = fields[3]
            let answerB = fields[4]
            let answerC = fields[5]
            let answerD = fields[6]
            let richtig = fields[7].uppercased()
            let kategorie = fields[8]

            // Richtige Antwort ermitteln
            let correctIndex: Int
            let answers: [String]

            switch richtig {
            case "A":
                correctIndex = 0
                answers = [answerA, answerB, answerC, answerD]
            case "B":
                correctIndex = 1
                answers = [answerB, answerA, answerC, answerD]
            case "C":
                correctIndex = 2
                answers = [answerC, answerA, answerB, answerD]
            case "D":
                correctIndex = 3
                answers = [answerD, answerA, answerB, answerC]
            default:
                #if DEBUG
                print("Ungültige Antwort: \(richtig) in Zeile \(index + 1)")
                #endif
                continue
            }

            // Erklärung generieren (basierend auf Kategorie)
            let erklaerung = generateErklaerung(frage: frage, richtig: answers[0], kategorie: kategorie)

            let question = Question(
                level: level,
                text: frage,
                answers: answers,
                correctIndex: 0, // Immer 0, da wir die richtige Antwort an Index 0 setzen
                erklaerung: erklaerung
            )

            questions.append(question)
        }

        #if DEBUG
        print("CSV geladen: \(questions.count) Fragen aus \(Set(questions.map { $0.level }).count) Levels")
        #endif

        return questions
    }

    /// Parst eine einzelne CSV-Zeile mit Anführungszeichen-Unterstützung
    private static func parseCSVLine(_ line: String) -> [String] {
        var fields: [String] = []
        var currentField = ""
        var insideQuotes = false

        for char in line {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == "," && !insideQuotes {
                fields.append(currentField.trimmingCharacters(in: .whitespaces))
                currentField = ""
            } else {
                currentField.append(char)
            }
        }

        // Letztes Feld hinzufügen
        fields.append(currentField.trimmingCharacters(in: .whitespaces))

        return fields
    }

    /// Generiert Erklärung basierend auf Kategorie
    private static func generateErklaerung(frage: String, richtig: String, kategorie: String) -> String {
        switch kategorie {
        case "HACCP":
            return "✓ \(richtig). HACCP (Hazard Analysis Critical Control Points) ist ein präventives System zur Lebensmittelsicherheit."
        case "Hygiene":
            return "✓ \(richtig). Hygienemaßnahmen schützen vor Kreuzkontamination und Infektionen."
        case "Wareneingang":
            return "✓ \(richtig). Bei der Warenannahme müssen HACCP-Richtlinien eingehalten werden."
        case "Garmethoden":
            return "✓ \(richtig). Die richtige Garmethode beeinflusst Nährstofferhalt, Geschmack und Textur."
        case "Allergene":
            return "✓ \(richtig). Die 14 Hauptallergene müssen laut EU-Verordnung 1169/2011 gekennzeichnet werden."
        case "Nährwerte":
            return "✓ \(richtig). Eine ausgewogene Ernährung nach DGE-Empfehlungen fördert die Gesundheit."
        default:
            return "✓ \(richtig)"
        }
    }
}
