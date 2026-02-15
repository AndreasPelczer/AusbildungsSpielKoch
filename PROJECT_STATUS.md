# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-15 | Session: claude/setup-chef-quiz-game-Jyg7i (LexikonQuizGenerator)

---

## Aktueller Zustand

### Phase: 2. Lehrjahr gestartet! LexikonQuizGenerator erzeugt automatisch Fragen aus Lexikon-Daten.

Die App ist funktionsfähig und bei Apple eingereicht.
- 1. Lehrjahr: 166 handgeschriebene Fragen (Level 1–11) ✅
- 2. Lehrjahr: **Level 12–20 automatisch generiert** aus 134 Produkten, 20 Garmethoden, 20 Saucen ✅
- Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten ✅
- Jeder Levelstart generiert ~25–50 verschiedene Fragen, 10 werden zufällig ausgewählt

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
| 2026-02-15 | Garmethoden-DB: 20 Garmethoden | Andreas+Claude |
| 2026-02-15 | Saucen-DB: 20 Saucen | Andreas+Claude |
| 2026-02-15 | Level 10: 15 Fragen (Garmethoden) | Claude |
| 2026-02-15 | Level 11: 15 Fragen (Saucenkunde) | Claude |
| 2026-02-15 | Prüfungskonzept gespeichert | Andreas+Claude |
| 2026-02-15 | Lexikon-Tab implementiert | Claude |
| 2026-02-15 | **LexikonQuizGenerator: Level 12–20 automatisch generiert** | Claude |
| 2026-02-15 | **QuestionLoader: Generierte Fragen integriert** | Claude |

---

## Fragenbestand

### 1. Lehrjahr (handgeschrieben, JSON)

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
| 11 | 15 | Saucenkunde | ✅ |

### 2. Lehrjahr (automatisch generiert, Bloom-Taxonomie)

| Level | Bloom-Stufe | Thema | Pool-Größe |
|-------|-------------|-------|------------|
| 12 | ERKENNEN | Produkte identifizieren | ~30 |
| 13 | ERKENNEN | Garmethoden & Saucen identifizieren | ~50 |
| 14 | ZUORDNEN | Produkte → Kategorien zuordnen | ~35 |
| 15 | ZUORDNEN | Garmethoden & Saucen → Typen zuordnen | ~50 |
| 16 | WISSEN | Lagerung, Allergene, Nährwerte | ~35 |
| 17 | WISSEN | Temperaturen, Garmedien, Saucen-Basis | ~70 |
| 18 | ANWENDEN | Garmethode wählen, Allergene prüfen | ~55 |
| 19 | ANWENDEN | Ableitungen, Praxistipps, Klassiker | ~25 |
| 20 | BEWERTEN | Falschaussagen finden, Eignung beurteilen | ~55 |

**Gesamt: 166 feste + ~400 generierte Fragen = ~566 Fragen**

### 3. Lehrjahr (geplant)

| Level | Anzahl | Thema | Status |
|-------|--------|-------|--------|
| 21-30 | 0 | 3. Lehrjahr | Geplant |

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

## Zukunftsvision (von Andreas)

> "Das Ausbildungsspiel Küche für Köchinnen und Köche"

- **6 Halbjahre** nach IHK-Rahmenplan
- **Zwischenprüfung** = "Commis-Prüfung" / Endgegner
- **Abschlussprüfung** = "Bossfight"
- Karrierepfad: Commis → Demi-Chef → Chef de Partie → Sous-Chef → Küchenchef

---

## Offene Aufgaben

### P0 - Nächste Schritte
- [ ] **Andreas prüft Level 4–11 Fragen fachlich** (90 neue Fragen!)
- [ ] **Fragen-Datei umbenennen** (heißt noch `iMOPS_Koch_Fragen_Level1-3.json` — enthält Level 1-11)
- [ ] **Level 12–20 in Xcode testen** (LexikonQuizGenerator)

### P1 - 2. Lehrjahr Verfeinerung
- [ ] Generierte Fragen in der App testen (alle 9 Levels durchspielen)
- [ ] Fragen-Qualität prüfen und ggf. Templates anpassen
- [ ] Weitere Fragen-Templates hinzufügen (z.B. Bilder-Fragen)

### P2 - App-Features
- [ ] Prüfungsmodul implementieren (Timer, Zufallsfragen, Bestanden/Nicht bestanden)
- [ ] "Commis-Prüfung" (Zwischenprüfung) als Endgegner
- [ ] "Bossfight" (Abschlussprüfung)
- [x] ~~Lexikon-Tab in der App~~ ERLEDIGT
- [x] ~~Warenkunde-Bereich~~ ERLEDIGT

### P3 - Später
- [ ] 3. Lehrjahr (Level 21-30)
- [ ] 6-Halbjahre-Struktur nach IHK-Rahmenplan
- [ ] App Store Screenshots
- [ ] Ausbilder-Report Feature
- [ ] Zertifikat-PDF Feature

---

## Hinweise für die nächste Session

1. **LexikonQuizGenerator.swift** generiert Level 12–20 automatisch aus Lexikon-Daten
2. **QuestionLoader** lädt jetzt JSON-Fragen (1–11) UND generierte Fragen (12–20)
3. **Fragen werden gecacht** — pro App-Session einmal generiert, dann aus Cache
4. **Jedes Level hat 25–70 Fragen im Pool**, 10 werden zufällig ausgewählt
5. **Bloom-Taxonomie** steuert den Schwierigkeitsgrad: Erkennen (leicht) → Bewerten (schwer)
6. **Fragen-Datei heißt noch `iMOPS_Koch_Fragen_Level1-3.json`** — Umbenennung sinnvoll

---

*Nächste Aktualisierung: Nach Testing + 3. Lehrjahr*
