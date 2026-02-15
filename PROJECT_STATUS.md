# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i

---

## Aktueller Zustand

### Phase: App läuft, bei Apple eingereicht. Lexikon-Bereinigung + Level 4 Fragen erstellt.

Die App ist funktionsfähig und bei Apple zur Prüfung eingereicht.
Matjes-Datenbank (Lexikon + Produkte) wurde ins Repo integriert.
Lexikon bereinigt (53 Duplikate entfernt), Level 4 Fragen geschrieben.

---

## Erledigte Aufgaben

| Datum | Was | Wer |
|-------|-----|-----|
| 2026-02-15 | Neues Repo `AusbildungsSpielKoch` auf GitHub erstellt | Andreas |
| 2026-02-15 | Xcode-Projekt angelegt, läuft im Simulator | Andreas |
| 2026-02-15 | Matjes-Icon in AppIcon.appiconset eingefügt | Andreas |
| 2026-02-15 | CLAUDE.md und PROJECT_STATUS.md erstellt | Claude |
| 2026-02-15 | Swift-Code aus altem Projekt migriert (11 Dateien) | Claude |
| 2026-02-15 | Alle verbotenen Namen bereinigt | Claude |
| 2026-02-15 | Fragen-JSON (45 Fragen, Level 1-3) kopiert | Claude |
| 2026-02-15 | PrivacyInfo.xcprivacy erstellt | Claude |
| 2026-02-15 | App bei Apple eingereicht | Andreas |
| 2026-02-15 | Matjes-Datenbank (Lexikon + Produkte) ins Repo gepusht | Andreas |
| 2026-02-15 | **Lexikon bereinigt: 214 → 161 Einträge (53 Duplikate entfernt)** | Claude |
| 2026-02-15 | **Level 4 Fragen geschrieben: 15 Fragen (Arbeitstechniken I)** | Claude |

---

## Fragenbestand

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 1 | 15 | Hygiene & Arbeitsschutz | Vorhanden |
| 2 | 15 | Küchenbrigade & Arbeitsabläufe | Vorhanden |
| 3 | 16 | Warenkunde & Schnitttechniken | Vorhanden |
| 4 | 15 | Grundlegende Arbeitstechniken I | **NEU** |
| 5-30 | 0 | Siehe Level-Map in README.md | Offen |

**Gesamt: 61 Fragen (von 450 Ziel)**

---

## Lexikon-Datenbank

| Datei | Einträge | Status |
|-------|----------|--------|
| Koch_Lexikon.json (bereinigt) | 161 | Bereinigt, bereit für App-Integration |
| Matjes/Lexikon.json (Original) | 214 | Quell-Datei mit 53 Duplikaten |
| Matjes/Produkte.json (Original) | 848 | Messe-Catering, muss für Azubis umgebaut werden |

### Lexikon-Bereinigung Details:
- 50 echte Duplikate entfernt (identischer Code + identischer Text)
- 3 Near-Duplikate entfernt (gleicher Name + gleiche Kategorie, falsche Code-Prefixe)
- 11 kontextabhängige Einträge BEHALTEN (z.B. Blanchieren als Technik + Vorbereitung)

---

## Offene Aufgaben (Priorität)

### P0 - Nächste Schritte
- [ ] **Andreas prüft Level 4 Fragen fachlich** (15 Fragen zu Arbeitstechniken I)
- [ ] **Produkte-Datenbank: Andreas bringt neue Daten** (allgemeine Warenkunde statt Messe-Catering)
- [ ] **Kategorien für Produkte/Lexikon gemeinsam festlegen**

### P1 - Fragen weiterschreiben
- [ ] Level 5: Grundlegende Arbeitstechniken II (Braten, Schmoren, Frittieren, Fonds)
- [ ] Level 6: Warenkunde Tierisch (Fleisch, Geflügel, Fisch)
- [ ] Level 7-10: Weitere Fragen 1. Lehrjahr

### P2 - App-Features (v2 Planung)
- [ ] Lexikon-Tab in der App (Phase 1)
- [ ] Verlinkung Quiz-Erklärungen → Lexikon-Einträge
- [ ] Warenkunde-Bereich (Phase 2)

### P3 - Später
- [ ] Fragen für Level 11-30
- [ ] App Store Screenshots
- [ ] Fachkraft Küche Track (2-jährige Ausbildung)

---

## Datei-Übersicht

### Neue Dateien in dieser Session:
```
AusbildungsSpielKoch/Resources/Koch_Lexikon.json  ← Bereinigtes Lexikon (161 Einträge)
```

### Geänderte Dateien:
```
AusbildungsSpielKoch/Resources/iMOPS_Koch_Fragen_Level1-3.json  ← +15 Level 4 Fragen
```

### Matjes-Datenbank (von Andreas gepusht):
```
Matjes/Matjes/Resources/Kühlhaus/Lexikon.json    ← Original (214 Einträge)
Matjes/Matjes/Resources/Kühlhaus/Produkte.json   ← Original (848 Einträge)
```

---

## Hinweise für die nächste Session

1. **Lexikon ist bereinigt** -- Koch_Lexikon.json ist die saubere Version (161 Einträge)
2. **Level 4 Fragen brauchen Andreas' fachliches OK** -- er hat 30 Jahre Küchenerfahrung
3. **Produkte-Daten kommen von Andreas** -- neue allgemeine Warenkunde statt Messe-Catering
4. **QuestionLoader lädt aktuell nur eine JSON-Datei** -- bei Umbenennung muss der Loader angepasst werden
5. **Kontextabhängige Lexikon-Einträge sind gewollt** -- gleicher Begriff in verschiedenen Kategorien = verschiedener Kontext
6. **v2 Vision besprochen** -- Quiz + Lexikon + Warenkunde als Dreiklang, Phasen-Plan steht

---

*Nächste Aktualisierung: Nach Andreas' Feedback zu Level 4 Fragen + neue Produkte-Daten*
