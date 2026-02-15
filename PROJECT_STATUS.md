# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i

---

## Aktueller Zustand

### Phase: 134 Produkte + 136 Fragen (Level 1–9). Erstes Lehrjahr fast komplett.

Die App ist funktionsfähig und bei Apple zur Prüfung eingereicht.
Produkte-Datenbank massiv erweitert: 134 Produkte in 10 Kategorien.
9 von 10 Leveln des 1. Lehrjahrs haben Fragen (136 gesamt).

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
| 2026-02-15 | Lexikon bereinigt: 214 → 161 Einträge (53 Duplikate entfernt) | Claude |
| 2026-02-15 | Level 4 Fragen: 15 Fragen (Arbeitstechniken I) | Claude |
| 2026-02-15 | Alte Produkte-Datei gelöscht (848 Messe-Catering-Produkte) | Claude |
| 2026-02-15 | Neue Produkte-DB: 36 Produkte Gemüse/Kartoffeln/Salat/Pilze/Hülsenfrüchte | Andreas+Claude |
| 2026-02-15 | Level 5 Fragen: 15 Fragen (Warenkunde vertieft) | Claude |
| 2026-02-15 | **+98 Produkte: Fleisch (25), Fisch (24), Milch (24), Gewürze (25)** | Andreas+Claude |
| 2026-02-15 | **Level 6: 15 Fragen (Fleisch & Innereien)** | Claude |
| 2026-02-15 | **Level 7: 15 Fragen (Fisch & Meeresfrüchte)** | Claude |
| 2026-02-15 | **Level 8: 15 Fragen (Milchprodukte & Käse)** | Claude |
| 2026-02-15 | **Level 9: 15 Fragen (Gewürze)** | Claude |

---

## Fragenbestand

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 1 | 15 | Hygiene & Arbeitsschutz | Vorhanden |
| 2 | 15 | Küchenbrigade & Arbeitsabläufe | Vorhanden |
| 3 | 16 | Warenkunde & Schnitttechniken | Vorhanden |
| 4 | 15 | Grundlegende Arbeitstechniken I | Vorhanden |
| 5 | 15 | Warenkunde vertieft (Lagerung, Allergene, Sorten) | Vorhanden |
| 6 | 15 | Fleisch & Innereien | **NEU** |
| 7 | 15 | Fisch & Meeresfrüchte | **NEU** |
| 8 | 15 | Milchprodukte & Käse | **NEU** |
| 9 | 15 | Gewürze | **NEU** |
| 10 | 0 | Noch offen (1. Lehrjahr Abschluss) | Offen |
| 11-30 | 0 | 2. + 3. Lehrjahr | Offen |

**Gesamt: 136 Fragen (von 450 Ziel = 30%)**

---

## Datenbanken

### Produkte-DB (Koch_Produkte.json)
| Kategorie | Anzahl |
|-----------|--------|
| Fleisch | 25 |
| Gewürze | 25 |
| Milchprodukte | 24 |
| Gemüse | 22 |
| Fisch | 16 |
| Meeresfrüchte | 8 |
| Kartoffeln | 4 |
| Salat | 4 |
| Pilze | 3 |
| Hülsenfrüchte | 3 |
| **Gesamt** | **134** |

Jedes Produkt hat: ID, Name, Kategorie, Typ, Beschreibung, Lagerung, Saison, Allergene, Zusatzstoffe, Nährwerte.

### Lexikon
| Datei | Einträge | Status |
|-------|----------|--------|
| Koch_Lexikon.json | 161 | Bereinigt, bereit für App-Integration |

---

## Offene Aufgaben (Priorität)

### P0 - Nächste Schritte
- [ ] **Andreas prüft Level 4–9 Fragen fachlich** (60 neue Fragen!)
- [ ] **Level 10 Fragen schreiben** (1. Lehrjahr Abschluss — Thema?)
- [ ] **CLAUDE.md Fragenbestand aktualisieren** (zeigt noch nur Level 1-3)

### P1 - Fragen 2. Lehrjahr
- [ ] Level 11-20 Fragen (Themen mit Andreas besprechen)
- [ ] Mögliche Themen: Saucenkunde, Suppen, Teige, Garmethoden vertieft, Ernährungslehre, Menüplanung

### P2 - App-Features (v2 Planung)
- [ ] Lexikon-Tab in der App
- [ ] Warenkunde-Bereich (134 Produkte anzeigen)
- [ ] Verlinkung Quiz-Erklärungen → Lexikon/Produkte
- [ ] Codiclodi-Konzept evaluieren (Andreas' Konzeptdokument)

### P3 - Später
- [ ] Fragen für Level 21-30 (3. Lehrjahr)
- [ ] App Store Screenshots
- [ ] Fachkraft Küche Track (2-jährige Ausbildung)
- [ ] Bild-basierte Fragen (Level 1 aus Codiclodi-Konzept: "Erkennen")

---

## Datei-Übersicht (aktuelle Session)

### Geänderte Dateien:
```
AusbildungsSpielKoch/Resources/Koch_Produkte.json              ← 36 → 134 Produkte (+98)
AusbildungsSpielKoch/Resources/iMOPS_Koch_Fragen_Level1-3.json ← 76 → 136 Fragen (+60)
PROJECT_STATUS.md                                               ← Aktualisiert
```

---

## Hinweise für die nächste Session

1. **Koch_Produkte.json hat jetzt 134 Produkte** — alle 4 neuen Kategorien von Andreas drin
2. **136 Fragen in 9 Leveln** — Level 10 fehlt noch für komplettes 1. Lehrjahr
3. **QuestionLoader lädt aktuell nur eine JSON-Datei** — bei Umbenennung Loader anpassen
4. **Codiclodi-Konzeptdokument von Andreas** — enthält Ideen für relationale DB, 5-stufiges Fragenkonzept, Zugriffssystem
5. **Fragen-Datei heißt noch iMOPS_Koch_Fragen_Level1-3.json** — Umbenennung sinnvoll (enthält jetzt Level 1-9!)
6. **Allergene sind in den Produkten erfasst** — Fisch (Nr. 4), Milch (Nr. 7), Krebstiere (Nr. 2), Weichtiere (Nr. 14), Senf (Nr. 10), Sellerie (Nr. 9)

---

*Nächste Aktualisierung: Nach Andreas' Feedback zu Level 4–9 Fragen*
