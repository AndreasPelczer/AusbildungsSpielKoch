# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i

---

## Aktueller Zustand

### Phase: App läuft. Neue Produkte-DB + Level 5 Fragen erstellt.

Die App ist funktionsfähig und bei Apple zur Prüfung eingereicht.
Lexikon bereinigt (161 Einträge), neue Produkte-DB (36 Produkte) von Andreas geliefert.
Level 4 (Arbeitstechniken) + Level 5 (Warenkunde vertieft) Fragen geschrieben.

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
| 2026-02-15 | Level 4 Fragen geschrieben: 15 Fragen (Arbeitstechniken I) | Claude |
| 2026-02-15 | **Alte Produkte-Datei gelöscht** (848 Messe-Catering-Produkte) | Claude |
| 2026-02-15 | **Neue Produkte-DB: 36 Produkte** (Koch_Produkte.json) von Andreas | Andreas+Claude |
| 2026-02-15 | **Level 5 Fragen: 15 Fragen** (Warenkunde vertieft) | Claude |

---

## Fragenbestand

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 1 | 15 | Hygiene & Arbeitsschutz | Vorhanden |
| 2 | 15 | Küchenbrigade & Arbeitsabläufe | Vorhanden |
| 3 | 16 | Warenkunde & Schnitttechniken | Vorhanden |
| 4 | 15 | Grundlegende Arbeitstechniken I | Vorhanden |
| 5 | 15 | Warenkunde vertieft (Lagerung, Allergene, Sorten) | **NEU** |
| 6-30 | 0 | Noch offen | Offen |

**Gesamt: 76 Fragen (von 450 Ziel)**

---

## Datenbanken

### Produkte (NEU)
| Datei | Einträge | Kategorien |
|-------|----------|------------|
| Koch_Produkte.json | 36 | Gemüse (22), Kartoffeln (4), Salat (4), Pilze (3), Hülsenfrüchte (3) |

### Lexikon
| Datei | Einträge | Status |
|-------|----------|--------|
| Koch_Lexikon.json | 161 | Bereinigt, bereit für App-Integration |

### Gelöscht
| Datei | Grund |
|-------|-------|
| ~~Matjes/Produkte.json~~ | Alte Messe-Catering-Daten (848 Stk), ersetzt durch Koch_Produkte.json |

---

## Offene Aufgaben (Priorität)

### P0 - Nächste Schritte
- [ ] **Andreas prüft Level 4+5 Fragen fachlich**
- [ ] **Kategorien für Produkte/Lexikon gemeinsam festlegen** (Umbenennung?)
- [ ] **Weitere Produkt-Kategorien von Andreas** (Fleisch, Fisch, Milch, Gewürze?)

### P1 - Fragen weiterschreiben
- [ ] Level 6: Grundlegende Arbeitstechniken II (Braten, Schmoren, Frittieren, Fonds)
- [ ] Level 7: Warenkunde Tierisch (Fleisch, Geflügel, Fisch)
- [ ] Level 8-10: Weitere Fragen 1. Lehrjahr

### P2 - App-Features (v2 Planung)
- [ ] Lexikon-Tab in der App
- [ ] Warenkunde-Bereich (Produkte-DB anzeigen)
- [ ] Verlinkung Quiz-Erklärungen → Lexikon/Produkte

### P3 - Später
- [ ] Fragen für Level 11-30
- [ ] App Store Screenshots
- [ ] Fachkraft Küche Track (2-jährige Ausbildung)

---

## Datei-Übersicht (aktuelle Session)

### Neue Dateien:
```
AusbildungsSpielKoch/Resources/Koch_Lexikon.json    ← Bereinigtes Lexikon (161 Einträge)
AusbildungsSpielKoch/Resources/Koch_Produkte.json   ← Neue Produkte-DB (36 Einträge)
```

### Geänderte Dateien:
```
AusbildungsSpielKoch/Resources/iMOPS_Koch_Fragen_Level1-3.json  ← +15 Level 4 + 15 Level 5 Fragen
```

### Gelöschte Dateien:
```
Matjes/Matjes/Resources/Kühlhaus/Produkte.json  ← Alte Messe-Catering-Daten
```

---

## Hinweise für die nächste Session

1. **Koch_Produkte.json ist die neue Produkte-DB** — 36 Produkte, sauberes Format
2. **Level 4+5 Fragen brauchen Andreas' OK** — fachliche Prüfung
3. **QuestionLoader lädt aktuell nur eine JSON-Datei** — bei Umbenennung Loader anpassen
4. **Produkte-DB hat Nährwerte, Allergene, Lagerung, Saison** — fertig für App-Integration
5. **Matjes/Lexikon.json existiert noch** — Original-Lexikon als Referenz

---

*Nächste Aktualisierung: Nach Andreas' Feedback + weitere Produkt-Kategorien*
