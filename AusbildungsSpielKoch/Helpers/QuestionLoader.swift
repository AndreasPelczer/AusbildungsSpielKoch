//
//  QuestionLoader.swift
//  AusbildungsSpielKoch
//
//  JSON-Parser für Küchenfachkunde-Fragen
//

import Foundation

class QuestionLoader {

    /// Gecachte Fragen (JSON + generierte), werden nur einmal pro Session geladen
    private static var cachedQuestions: [Question]?

    static func loadFromJSON() -> [Question] {
        if let cached = cachedQuestions {
            return cached
        }

        var questions: [Question] = []

        // 1. JSON-Fragen laden (Level 1–11)
        if let url = Bundle.main.url(forResource: "Matjes_Fragen_Level1-11", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                questions = try JSONDecoder().decode([Question].self, from: data)
                #if DEBUG
                print("JSON geladen: \(questions.count) Fragen (Level 1-11)")
                #endif
            } catch {
                #if DEBUG
                print("JSON-Ladefehler: \(error)")
                #endif
            }
        } else {
            #if DEBUG
            print("JSON-Datei nicht gefunden!")
            #endif
        }

        // 2. CSV-Fragen laden (Level 21-30, handkuratiert)
        let csvQuestions = CSVQuestionLoader.loadFromCSV(filename: "Quiz_Fragen_Level_21-30")
        questions.append(contentsOf: csvQuestions)

        // 3. Generierte Fragen aus Lexikon-Daten (Level 12–30)
        // CSV-Fragen haben Vorrang, generierte Fragen ergänzen
        for level in LexikonQuizGenerator.generatedLevels.sorted() {
            let generated = LexikonQuizGenerator.generateQuestions(forLevel: level)
            questions.append(contentsOf: generated)
            #if DEBUG
            print("Level \(level): \(generated.count) generierte Fragen")
            #endif
        }

        cachedQuestions = questions
        return questions
    }

    static func availableLevels(in questions: [Question]) -> Set<Int> {
        Set(questions.map { $0.level })
    }
}
