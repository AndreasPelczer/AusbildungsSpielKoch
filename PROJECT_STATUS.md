# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i (Cleanup)

---

## Aktueller Zustand

### Phase: Cleanup — Altes Matjes-Projekt entfernt

Die App ist funktionsfähig und bei Apple eingereicht.
- App heißt **"Matjes, der kleine Hering"** (Anspielung auf "Der junge Koch" + "Hering"-Lexikon)
- **20 Level** in 2 Lehrjahren (statt 30 in 3)
- 1. Lehrjahr (Level 1-10): Handkuratierte Fragen
- 2. Lehrjahr (Level 11-20): Level 11 handkuratiert + Level 12-20 automatisch generiert
- Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten
- **Prüfungsmodul** (Commis-Prüfung + Bossfight) implementiert
- **Cleanup**: Alter `Matjes/`-Ordner mit separatem Xcode-Projekt entfernt (kollidierte mit Hauptprojekt)

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
| 2026-02-15 | **Matjes-Rebranding: UI, 20-Level-System, JSON-Umbenennung** | Claude |
| 2026-02-15 | Prüfungsmodul: Commis-Prüfung + Bossfight | Claude |
| 2026-02-15 | **Cleanup: Alten Matjes/-Ordner entfernt (Target-Kollisionen behoben)** | Claude |

---

## Fragenbestand

### 1. Lehrjahr (handgeschrieben, JSON: `Matjes_Fragen_Level1-11.json`)

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 1 | 15 | Hygiene & Arbeitsschutz | ✅ |
| 2 | 15 | Küchenbrigade & Arbeitsabläufe | ✅ |
| 3 | 16 | Warenkunde & Schnitttechniken | ✅ |
| 4 | 15 | Grundlegende Arbeitstechniken I | ✅ |
| 5 | 15 | Warenkunde vertieft (Lagerung, Allergene) | ✅ |
| 6 | 15 | Fleisch & Innereien | ✅ |
| 7 | 15 | Fisch & Meeresfrüchte | ✅ |
| 8 | 15 | Milchprodukte & Käse | ✅ |
| 9 | 15 | Gewürze | ✅ |
| 10 | 15 | Garmethoden | ✅ |

### 2. Lehrjahr

| Level | Quelle | Bloom-Stufe | Thema | Pool-Größe |
|-------|--------|-------------|-------|------------|
| 11 | JSON | — | Saucenkunde | 15 |
| 12 | Generator | ERKENNEN | Produkte identifizieren | ~30 |
| 13 | Generator | ERKENNEN | Garmethoden & Saucen identifizieren | ~50 |
| 14 | Generator | ZUORDNEN | Produkte → Kategorien zuordnen | ~35 |
| 15 | Generator | ZUORDNEN | Garmethoden & Saucen → Typen zuordnen | ~50 |
| 16 | Generator | WISSEN | Lagerung, Allergene, Nährwerte | ~35 |
| 17 | Generator | WISSEN | Temperaturen, Garmedien, Saucen-Basis | ~70 |
| 18 | Generator | ANWENDEN | Garmethode wählen, Allergene prüfen | ~55 |
| 19 | Generator | ANWENDEN | Ableitungen, Praxistipps, Klassiker | ~25 |
| 20 | Generator | BEWERTEN | Falschaussagen finden, Eignung beurteilen | ~55 |

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

- **6 Halbjahre** nach IHK-Rahmenplan
- **Commis-Prüfung** = Endgegner (Ende jedes Halbjahres)
- **Bossfight** = Abschlussprüfung (80 Fragen / 60 Min.)
- Karrierepfad: Commis → Demi-Chef → Chef de Partie → Sous-Chef → Küchenchef

---

## Offene Aufgaben

### P0 - Nächste Schritte
- [x] ~~Alten Matjes/-Ordner entfernen (Target-Kollisionen)~~ ✅
- [x] ~~Commis-Prüfung + Bossfight implementieren~~ ✅
- [ ] **Andreas prüft Level 4–11 Fragen fachlich** (120 neue Fragen!)
- [ ] **Level 12–20 in Xcode testen** (LexikonQuizGenerator)

### P2 - App-Features
- [ ] Fortschritts-Dashboard (Stärken/Schwächen)
- [ ] Schwachstellen-Training (gezieltes Üben)
- [ ] 6-Halbjahre-Struktur nach IHK-Rahmenplan

### P3 - Später
- [ ] Zertifikate (PDF bei bestandener Prüfung)
- [ ] Ausbilder-Reports
- [ ] Abo-Modell
- [ ] App Store Screenshots

---

## Hinweise für die nächste Session

1. **App heißt "Matjes, der kleine Hering"** — Xcode-Projekt bleibt `AusbildungsSpielKoch`
2. **20 Level** in 2 Lehrjahren (Level 1-10 + Level 11-20)
3. **Prüfungsmodul** ist implementiert (Commis-Prüfung + Bossfight)
4. **Alter Matjes/-Ordner** wurde entfernt — nur `AusbildungsSpielKoch.xcodeproj` ist aktiv
5. **LexikonQuizGenerator.swift** generiert Level 12–20 automatisch aus Lexikon-Daten
6. **Nächstes großes Feature**: Fortschritts-Dashboard oder 6-Halbjahre-Struktur

---

*Nächste Aktualisierung: Nach nächstem Feature*
