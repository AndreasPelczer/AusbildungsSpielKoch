# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i (Compiler-Fix + Übergabe)

---

## Aktueller Zustand

### Phase: 4-Halbjahre-Struktur implementiert

Die App ist funktionsfähig und bei Apple eingereicht.
- App heißt **"Matjes, der kleine Hering"** (Anspielung auf "Der junge Koch" + "Hering"-Lexikon)
- **20 Level** in **4 Halbjahren** (je 5 Level)
- **Sequentielle Freischaltung**: Halbjahr 2 erst nach Level 5, etc.
- **Commis-Prüfung** nach Halbjahr 3 (Level 15), **Bossfight** nach Halbjahr 4 (Level 20)
- Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten

### Halbjahr-Struktur

| Block | Level | Inhalt | Freischaltung |
|-------|-------|--------|---------------|
| **1. Halbjahr** | 1-5 | Grundlagen | Immer offen |
| **2. Halbjahr** | 6-10 | Warenkunde | Nach Level 5 |
| **3. Halbjahr** | 11-15 | Vertiefung | Nach Level 10 |
| **Commis-Prüfung** | — | 30 Fragen / 20 Min. | Nach Level 15 |
| **4. Halbjahr** | 16-20 | Anwenden & Bewerten | Nach Level 15 |
| **Bossfight** | — | 50 Fragen / 40 Min. | Nach Level 20 |
| *5.+6. Halbjahr* | *später* | *IHK-Erweiterung* | *kommt noch* |

---

## Erledigte Aufgaben

| Datum | Was | Wer |
|-------|-----|-----|
| 2026-02-15 | Neues Repo erstellt + Xcode-Projekt | Andreas |
| 2026-02-15 | Swift-Code migriert, CLAUDE.md erstellt | Claude |
| 2026-02-15 | Fragen Level 1-3 (45 Fragen) | Claude |
| 2026-02-15 | App bei Apple eingereicht | Andreas |
| 2026-02-15 | Lexikon bereinigt (214→161 Einträge) | Claude |
| 2026-02-15 | Level 4-5 Fragen (30 Fragen) | Claude |
| 2026-02-15 | Produkte-DB: 36 Gemüse-Produkte | Andreas+Claude |
| 2026-02-15 | +98 Produkte: Fleisch, Fisch, Milch, Gewürze | Andreas+Claude |
| 2026-02-15 | Level 6-9 Fragen (60 Fragen) | Claude |
| 2026-02-15 | Garmethoden-DB: 20 Garmethoden | Andreas+Claude |
| 2026-02-15 | Saucen-DB: 20 Saucen | Andreas+Claude |
| 2026-02-15 | Level 10: 15 Fragen (Garmethoden) | Claude |
| 2026-02-15 | Level 11: 15 Fragen (Saucenkunde) | Claude |
| 2026-02-15 | Prüfungskonzept gespeichert | Andreas+Claude |
| 2026-02-15 | Lexikon-Tab implementiert | Claude |
| 2026-02-15 | LexikonQuizGenerator: Level 12–20 automatisch generiert | Claude |
| 2026-02-15 | QuestionLoader: Generierte Fragen integriert | Claude |
| 2026-02-15 | Matjes-Rebranding: UI, 20-Level-System, JSON-Umbenennung | Claude |
| 2026-02-15 | Prüfungsmodul: Commis-Prüfung + Bossfight | Claude |
| 2026-02-15 | Cleanup: Alten Matjes/-Ordner entfernt | Claude |
| 2026-02-15 | LexikonQuizGenerator: Unicode-Fehler behoben | Claude |
| 2026-02-15 | **4-Halbjahre-Umbau: StartScreen, LevelGrid, ExamConfig, ProgressManager** | Claude |
| 2026-02-15 | **Compiler-Fix: StartScreenView.swift Zeile 321 – Expression zu komplex** | Claude |
| 2026-02-15 | Andreas: Claude-Branch lokal gemerged (PR war noch nicht gemerged) | Andreas+Claude |

---

## Fragenbestand

### Halbjahr 1 + 2 (handgeschrieben, JSON: `Matjes_Fragen_Level1-11.json`)

| Level | HJ | Anzahl | Thema | Status |
|-------|----|--------|-------|--------|
| 1 | 1 | 15 | Hygiene & Arbeitsschutz | ✅ |
| 2 | 1 | 15 | Küchenbrigade & Arbeitsabläufe | ✅ |
| 3 | 1 | 16 | Warenkunde & Schnitttechniken | ✅ |
| 4 | 1 | 15 | Grundlegende Arbeitstechniken I | ✅ |
| 5 | 1 | 15 | Warenkunde vertieft (Lagerung, Allergene) | ✅ |
| 6 | 2 | 15 | Fleisch & Innereien | ✅ |
| 7 | 2 | 15 | Fisch & Meeresfrüchte | ✅ |
| 8 | 2 | 15 | Milchprodukte & Käse | ✅ |
| 9 | 2 | 15 | Gewürze | ✅ |
| 10 | 2 | 15 | Garmethoden | ✅ |

### Halbjahr 3 + 4

| Level | HJ | Quelle | Bloom-Stufe | Thema | Pool-Größe |
|-------|----|--------|-------------|-------|------------|
| 11 | 3 | JSON | — | Saucenkunde | 15 |
| 12 | 3 | Generator | ERKENNEN | Produkte identifizieren | ~30 |
| 13 | 3 | Generator | ERKENNEN | Garmethoden & Saucen identifizieren | ~50 |
| 14 | 3 | Generator | ZUORDNEN | Produkte → Kategorien zuordnen | ~35 |
| 15 | 3 | Generator | ZUORDNEN | Garmethoden & Saucen → Typen zuordnen | ~50 |
| 16 | 4 | Generator | WISSEN | Lagerung, Allergene, Nährwerte | ~35 |
| 17 | 4 | Generator | WISSEN | Temperaturen, Garmedien, Saucen-Basis | ~70 |
| 18 | 4 | Generator | ANWENDEN | Garmethode wählen, Allergene prüfen | ~55 |
| 19 | 4 | Generator | ANWENDEN | Ableitungen, Praxistipps, Klassiker | ~25 |
| 20 | 4 | Generator | BEWERTEN | Falschaussagen finden, Eignung beurteilen | ~55 |

**Gesamt: 166 feste + ~400 generierte Fragen = ~566 Fragen**

---

## Datenbanken

| Datei | Einträge | Inhalt |
|-------|----------|--------|
| Matjes_Fragen_Level1-11.json | 166 | Handkuratierte Quizfragen |
| Koch_Produkte.json | 134 | Lebensmittel (Fleisch, Fisch, Milch, Gewürze, Gemüse, ...) |
| Koch_Garmethoden.json | 20 | Garmethoden (Kochen bis Marinieren) |
| Koch_Saucen.json | 20 | Soßen & Fonds (5 Muttersoßen, Fonds, Emulsionen, ...) |
| Koch_Pruefungskonzept.json | 4 Prüfungen + 6 Fragen | Zwischen- und Abschlussprüfungen |

---

## Zukunftsvision (von Andreas)

> "Matjes, der kleine Hering – Das Ausbildungsspiel der Küche"

- **6 Halbjahre** nach IHK-Rahmenplan (4 implementiert, 5+6 kommen)
- **Commis-Prüfung** = Zwischenprüfung nach Halbjahr 3
- **Bossfight** = Abschlussprüfung nach Halbjahr 4
- Karrierepfad: Commis → Demi-Chef → Chef de Partie → Sous-Chef → Küchenchef
- Andreas kümmert sich um mehr Fragen-Content

---

## Offene Aufgaben

### P0 - Nächste Schritte
- [x] ~~Alten Matjes/-Ordner entfernen~~ ✅
- [x] ~~Commis-Prüfung + Bossfight implementieren~~ ✅
- [x] ~~4-Halbjahre-Struktur mit Freischaltung~~ ✅
- [ ] **Andreas prüft Level 4–11 Fragen fachlich** (120 neue Fragen!)
- [ ] **Level 12–20 in Xcode testen** (LexikonQuizGenerator)
- [ ] **Andreas: Mehr Fragen-Content für später**

### P2 - App-Features
- [ ] Fortschritts-Dashboard (Stärken/Schwächen)
- [ ] Schwachstellen-Training (gezieltes Üben)
- [ ] Halbjahr 5+6 (IHK-Erweiterung)

### P3 - Später
- [ ] Zertifikate (PDF bei bestandener Prüfung)
- [ ] Ausbilder-Reports
- [ ] Abo-Modell
- [ ] App Store Screenshots

---

## Hinweise für die nächste Session

1. **App heißt "Matjes, der kleine Hering"** — Xcode-Projekt bleibt `AusbildungsSpielKoch`
2. **20 Level** in **4 Halbjahren** (je 5 Level, sequentiell freigeschaltet)
3. **Prüfungen**: Commis nach HJ3 (Level 15), Bossfight nach HJ4 (Level 20)
4. **LevelGridView** Parameter heißt jetzt `halbjahr` (nicht mehr `lehrjahr`)
5. **LexikonQuizGenerator.swift** verwendet Unicode-Escapes für deutsche Anführungszeichen
6. **Halbjahr 5+6** sind vorbereitet aber noch nicht implementiert
7. **StartScreenView.swift** hatte Compiler-Fehler (Zeile 321: "unable to type-check expression in reasonable time") – wurde gefixt durch Aufteilen in Sub-Expressions
8. **Git-Situation**: Andreas hat den `claude/setup-chef-quiz-game-Jyg7i` Branch direkt lokal gemerged, weil der PR noch nicht auf GitHub gemerged war. Andreas' lokaler main enthält jetzt den Stand vom Claude-Branch.

---

## Sitzungsprotokoll 2026-02-15 (letzte Session)

### Was passiert ist
1. **Compiler-Fehler**: Andreas hatte in Xcode den Fehler `StartScreenView.swift:321:25 – The compiler is unable to type-check this expression in reasonable time`
2. **Ursache**: SwiftUI-Expression in StartScreenView war zu komplex für den Swift-Compiler (verschachtelte Views + Modifiers)
3. **Fix**: Der Fix war bereits auf dem `claude/setup-chef-quiz-game-Jyg7i` Branch vorhanden (aus einer früheren Session), aber der PR war noch nicht gemerged
4. **Andreas' Git-Problem**: `git pull origin main` ergab "Already up to date", weil der Fix nur auf dem Claude-Branch lag, nicht auf main
5. **Lösung**: `git fetch origin claude/setup-chef-quiz-game-Jyg7i && git merge origin/claude/setup-chef-quiz-game-Jyg7i --no-edit`
6. **Ergebnis**: Andreas hat den Fix lokal, Compiler-Fehler ist behoben

### Wichtig für nächste Session
- **PR `claude/setup-chef-quiz-game-Jyg7i` → main** muss noch auf GitHub gemerged werden (oder ein neuer PR erstellt werden)
- Andreas' lokaler Stand enthält bereits alle Änderungen
- Falls Andreas pusht bevor der PR gemerged ist: `git push origin HEAD:main`

---

*Nächste Aktualisierung: Nach nächstem Feature*
