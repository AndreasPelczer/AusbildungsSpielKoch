# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i

---

## Aktueller Zustand

### Phase: Code-Migration abgeschlossen, Xcode-Integration ausstehend

Alle Swift-Dateien und Text-Ressourcen wurden aus dem alten Projekt migriert und umbenannt.
Andreas muss die Dateien in Xcode zum Target hinzufügen und die Audio-Dateien manuell kopieren.

---

## Erledigte Aufgaben

| Datum | Was | Wer |
|-------|-----|-----|
| 2026-02-15 | Neues Repo `AusbildungsSpielKoch` auf GitHub erstellt | Andreas |
| 2026-02-15 | Xcode-Projekt angelegt, läuft im Simulator | Andreas |
| 2026-02-15 | Matjes-Icon in AppIcon.appiconset eingefügt | Andreas |
| 2026-02-15 | CLAUDE.md und PROJECT_STATUS.md erstellt | Claude |
| 2026-02-15 | **Swift-Code aus altem Projekt migriert (11 Dateien)** | Claude |
| 2026-02-15 | **Alle verbotenen Namen bereinigt (millonen, KitchenMillionaire, Matjes)** | Claude |
| 2026-02-15 | **AusbildungsSpielKochApp.swift: SwiftData entfernt, ProgressManager eingebunden** | Claude |
| 2026-02-15 | **Fragen-JSON (45 Fragen, Level 1-3) kopiert** | Claude |
| 2026-02-15 | **PrivacyInfo.xcprivacy erstellt** | Claude |
| 2026-02-15 | **UserDefaults-Key umbenannt: Matjes_LevelProgress → AusbildungsSpielKoch_LevelProgress** | Claude |
| 2026-02-15 | **UI-Titel geändert: "Matjes" → "Ausbildungsspiel Koch"** | Claude |

---

## Offene Aufgaben (Priorität)

### P0 - Andreas muss machen (Xcode-Integration)
- [ ] **Alle neuen Swift-Dateien in Xcode zum Target hinzufügen**
  - Models/Question.swift, Models/LevelProgress.swift
  - ViewModels/GameViewModel.swift
  - Views/Main/StartScreenView.swift, LevelGridView.swift, LevelGameView.swift, ResultView.swift
  - Views/Components/AnswerButton.swift
  - Helpers/QuestionLoader.swift, ProgressManager.swift, SoundManager.swift
  - Resources/iMOPS_Koch_Fragen_Level1-3.json
  - PrivacyInfo.xcprivacy
- [ ] **Audio-Dateien manuell ins Repo kopieren**
  - Quelle: Altes Repo `Ausbildungsspiel/KitchenMillionaire/`
  - Ziel: `AusbildungsSpielKoch/Resources/Audio/`
  - Dateien: correct.mp3, wrong.mp3, applaus.wav, click.wav
- [ ] **Build im Simulator testen**

### P1 - Danach
- [ ] App-Icon validieren (Xcode > Product > Archive > Validate)
- [ ] Bundle-ID final setzen

### P2 - Später
- [ ] Fragen für Level 4-30 erstellen
- [ ] App Store Einreichung vorbereiten
- [ ] Screenshots für App Store erstellen

---

## Migrierte Dateien (Referenz)

### Umbenennungen im Code:
```
Header-Kommentare:  "millonen" → "AusbildungsSpielKoch"
Kommentare:         "Matjes Küchenfachkunde" → "AusbildungsSpielKoch" / entfernt
UserDefaults-Key:   "Matjes_LevelProgress" → "AusbildungsSpielKoch_LevelProgress"
App-Struct:         KitchenMillionaireApp → AusbildungsSpielKochApp (bereits korrekt im neuen Projekt)
UI-Titel:           "Matjes" + "Küchenfachkunde" → "Ausbildungsspiel" + "Koch"
```

### Datei-Mapping (abgeschlossen):
```
✅ KitchenMillionaire/Models/Question.swift        → AusbildungsSpielKoch/Models/Question.swift
✅ KitchenMillionaire/Models/LevelProgress.swift    → AusbildungsSpielKoch/Models/LevelProgress.swift
✅ KitchenMillionaire/ViewModels/GameViewModel.swift → AusbildungsSpielKoch/ViewModels/GameViewModel.swift
✅ KitchenMillionaire/Views/Main/StartScreenView.swift → AusbildungsSpielKoch/Views/Main/StartScreenView.swift
✅ KitchenMillionaire/Views/Main/LevelGridView.swift → AusbildungsSpielKoch/Views/Main/LevelGridView.swift
✅ KitchenMillionaire/Views/Main/LevelGameView.swift → AusbildungsSpielKoch/Views/Main/LevelGameView.swift
✅ KitchenMillionaire/Views/Main/ResultView.swift   → AusbildungsSpielKoch/Views/Main/ResultView.swift
✅ KitchenMillionaire/Views/Components/AnswerButton.swift → AusbildungsSpielKoch/Views/Components/AnswerButton.swift
✅ KitchenMillionaire/Helpers/QuestionLoader.swift   → AusbildungsSpielKoch/Helpers/QuestionLoader.swift
✅ KitchenMillionaire/Helpers/ProgressManager.swift  → AusbildungsSpielKoch/Helpers/ProgressManager.swift
✅ KitchenMillionaire/Helpers/SoundManager.swift     → AusbildungsSpielKoch/Helpers/SoundManager.swift
✅ KitchenMillionaire/iMOPS_Koch_Fragen_Level1-3.json → AusbildungsSpielKoch/Resources/iMOPS_Koch_Fragen_Level1-3.json
✅ KitchenMillionaire/PrivacyInfo.xcprivacy          → AusbildungsSpielKoch/PrivacyInfo.xcprivacy
⬜ KitchenMillionaire/correct.mp3                    → AusbildungsSpielKoch/Resources/Audio/correct.mp3 (Andreas)
⬜ KitchenMillionaire/wrong.mp3                      → AusbildungsSpielKoch/Resources/Audio/wrong.mp3 (Andreas)
⬜ KitchenMillionaire/applaus.wav                    → AusbildungsSpielKoch/Resources/Audio/applaus.wav (Andreas)
⬜ KitchenMillionaire/click.wav                      → AusbildungsSpielKoch/Resources/Audio/click.wav (Andreas)
```

---

## Git-Historie (Kurzform)

```
2026-02-15  Andreas: Initial commit - leeres Xcode-Projekt mit Matjes-Icon
2026-02-15  Claude: Code-Migration aus altem Projekt (11 Swift-Dateien + JSON + PrivacyInfo)
```

---

## Hinweise für die nächste Session

1. **Hauptaufgabe:** Warten auf Andreas' Xcode-Integration (Target-Zuordnung + Audio-Dateien)
2. **Icon ist fertig** - nicht anfassen!
3. **Kein SwiftData** - wurde entfernt, ProgressManager nutzt UserDefaults
4. **Alle verbotenen Namen sind bereinigt** - Grep-Check bestätigt
5. **45 Fragen** sind vorhanden (15 pro Level, Level 1-3)

---

*Nächste Aktualisierung: Nach Xcode-Integration durch Andreas*
