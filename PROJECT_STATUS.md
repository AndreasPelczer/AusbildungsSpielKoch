# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i

---

## Aktueller Zustand

### Phase: 1. Lehrjahr KOMPLETT. 166 Fragen, 134 Produkte, 20 Garmethoden, 20 Saucen.

Die App ist funktionsfähig und bei Apple eingereicht.
Alle 11 Level des 1. Lehrjahrs haben Fragen.
Prüfungskonzept (Zwischen- und Abschlussprüfungen) definiert.
5-Level-Fragenkonzept (Erkennen → Bewerten) für 2. Lehrjahr vorbereitet.

---

## Erledigte Aufgaben

| Datum | Was | Wer |
|-------|-----|-----|
| 2026-02-15 | Neues Repo erstellt + Xcode-Projekt | Andreas |
| 2026-02-15 | Swift-Code migriert, CLAUDE.md erstellt | Claude |
| 2026-02-15 | Fragen Level 1-3 (45 Fragen) kopiert | Claude |
| 2026-02-15 | App bei Apple eingereicht | Andreas |
| 2026-02-15 | Lexikon bereinigt (214→161 Einträge) | Claude |
| 2026-02-15 | Level 4-5 Fragen (30 Fragen) | Claude |
| 2026-02-15 | Produkte-DB: 36 Gemüse-Produkte | Andreas+Claude |
| 2026-02-15 | +98 Produkte: Fleisch, Fisch, Milch, Gewürze | Andreas+Claude |
| 2026-02-15 | Level 6-9 Fragen (60 Fragen) | Claude |
| 2026-02-15 | **Garmethoden-DB: 20 Garmethoden** (Koch_Garmethoden.json) | Andreas+Claude |
| 2026-02-15 | **Saucen-DB: 20 Saucen** (Koch_Saucen.json) | Andreas+Claude |
| 2026-02-15 | **Level 10: 15 Fragen (Garmethoden)** | Claude |
| 2026-02-15 | **Level 11: 15 Fragen (Saucenkunde)** | Claude |
| 2026-02-15 | **Prüfungskonzept gespeichert** (Koch_Pruefungskonzept.json) | Andreas+Claude |

---

## Fragenbestand

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 1 | 15 | Hygiene & Arbeitsschutz | Vorhanden |
| 2 | 15 | Küchenbrigade & Arbeitsabläufe | Vorhanden |
| 3 | 16 | Warenkunde & Schnitttechniken | Vorhanden |
| 4 | 15 | Grundlegende Arbeitstechniken I | Vorhanden |
| 5 | 15 | Warenkunde vertieft (Lagerung, Allergene) | Vorhanden |
| 6 | 15 | Fleisch & Innereien | Vorhanden |
| 7 | 15 | Fisch & Meeresfrüchte | Vorhanden |
| 8 | 15 | Milchprodukte & Käse | Vorhanden |
| 9 | 15 | Gewürze | Vorhanden |
| 10 | 15 | Garmethoden | **NEU** |
| 11 | 15 | Saucenkunde | **NEU** |
| 12-20 | 0 | 2. Lehrjahr (mit 5-Level-Konzept) | Geplant |
| 21-30 | 0 | 3. Lehrjahr | Geplant |

**Gesamt: 166 Fragen (von 450 Ziel = 37%) + 6 übergreifende Prüfungsfragen**

---

## Datenbanken

| Datei | Einträge | Inhalt |
|-------|----------|--------|
| Koch_Produkte.json | 134 | Lebensmittel (Fleisch, Fisch, Milch, Gewürze, Gemüse, ...) |
| Koch_Garmethoden.json | 20 | Garmethoden (Kochen bis Marinieren) |
| Koch_Saucen.json | 20 | Soßen & Fonds (5 Muttersoßen, Fonds, Emulsionen, ...) |
| Koch_Lexikon.json | 161 | Fachbegriffe |
| Koch_Pruefungskonzept.json | 4 Prüfungen + 6 Fragen | Zwischen- und Abschlussprüfungen |

---

## Prüfungskonzept (definiert, noch nicht implementiert)

| Prüfung | Fragen | Dauer | Bestehen |
|---------|--------|-------|----------|
| Zwischenprüfung 1. LJ | 40 | 30 Min | 70% |
| Zwischenprüfung 2. LJ | 50 | 45 Min | 70% |
| Zwischenprüfung 3. LJ | 50 | 45 Min | 75% |
| Abschlussprüfung (LAP) | 80 | 60 Min | 75% |

---

## Offene Aufgaben

### P0 - Nächste Schritte
- [ ] **Andreas prüft Level 4–11 Fragen fachlich** (90 neue Fragen!)
- [ ] **CLAUDE.md aktualisieren** (Fragenbestand, Projektstruktur)
- [ ] **Fragen-Datei umbenennen** (heißt noch `iMOPS_Koch_Fragen_Level1-3.json` — enthält Level 1-11)

### P1 - 2. Lehrjahr
- [ ] 5-Level-Fragenkonzept umsetzen (Erkennen→Zuordnen→Wissen→Anwenden→Bewerten)
- [ ] Fragen aus Andreas' Konzeptdokument ins 4-Antworten-Format adaptieren
- [ ] Level 12-20 Themen mit Andreas besprechen

### P2 - App-Features
- [ ] Prüfungsmodul implementieren (Timer, Zufallsfragen, Bestanden/Nicht bestanden)
- [ ] Lexikon-Tab in der App
- [ ] Warenkunde-Bereich (Produkte, Garmethoden, Saucen anzeigen)

### P3 - Später
- [ ] 3. Lehrjahr (Level 21-30)
- [ ] App Store Screenshots
- [ ] Ausbilder-Report Feature
- [ ] Zertifikat-PDF Feature

---

## Hinweise für die nächste Session

1. **166 Fragen in 11 Leveln** — 1. Lehrjahr ist inhaltlich komplett
2. **Fragen-Datei heißt noch `iMOPS_Koch_Fragen_Level1-3.json`** — Umbenennung sinnvoll
3. **5-Level-Konzept (Erkennen→Bewerten)** kommt erst im 2. Lehrjahr
4. **Prüfungskonzept ist definiert** — Koch_Pruefungskonzept.json enthält Struktur + 6 übergreifende Fragen
5. **Andreas' Codiclodi-Konzeptdokument** enthält noch 40+40 detaillierte Fragen zu Garmethoden und Saucen (Level 1-5 je 8 Fragen) — die sind für das 2. Lehrjahr vorgemerkt
6. **QuestionLoader** muss angepasst werden wenn Datei umbenannt wird

---

*Nächste Aktualisierung: Nach Andreas' Feedback + 2. Lehrjahr Planung*
