# PROJECT_STATUS.md - Aktueller Projektstatus

> **Diese Datei wird von jeder Claude-Session aktualisiert.**
> Letzte Aktualisierung: 2026-02-17 | Session: claude/add-book-reader-Idy0H (Buch-Feature + Quote-Fix)

---

## Aktueller Zustand

### Phase: Buch-Feature implementiert + Quote-Bug behoben

Die App ist funktionsfähig und bei Apple eingereicht.
- App heißt **"Matjes, der kleine Hering"** (Anspielung auf "Der junge Koch" + "Hering"-Lexikon)
- **3 Tabs**: Quiz, Lexikon, **Buch** (neu!)
- **20 Level** in **4 Halbjahren** (je 5 Level)
- **Sequentielle Freischaltung**: Halbjahr 2 erst nach Level 5, etc.
- **Commis-Prüfung** nach Halbjahr 3 (Level 15), **Bossfight** nach Halbjahr 4 (Level 20)
- Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten
- **PDF-Reader**: "Der junge Hering" Lehrbuch integriert

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
| 2026-02-17 | **Buch-Feature: PDF-Reader für "Der junge Hering" (3. Tab)** | Claude |
| 2026-02-17 | **Quote-Bug-Fix: Typografische Anführungszeichen in LexikonQuizGenerator** | Claude |
| 2026-02-17 | **Git-Disaster Recovery: Wiederherstellung nach falschem Reset** | Claude+Andreas |
| 2026-02-17 | **CLAUDE.md + PROJECT_STATUS.md aktualisiert** | Claude |

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
| Der_junge_Hering.pdf | — | Lehrbuch (⚠️ von Andreas manuell hinzufügen) |

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
2. **3 Tabs**: Quiz, Lexikon, **Buch** (PDF-Reader)
3. **20 Level** in **4 Halbjahren** (je 5 Level, sequentiell freigeschaltet)
4. **Prüfungen**: Commis nach HJ3 (Level 15), Bossfight nach HJ4 (Level 20)
5. **LevelGridView** Parameter heißt jetzt `halbjahr` (nicht mehr `lehrjahr`)
6. **LexikonQuizGenerator.swift** verwendet normale ASCII-Anführungszeichen (Quote-Bug gefixt!)
7. **Halbjahr 5+6** sind vorbereitet aber noch nicht implementiert
8. **Buch-Feature**: BuchReaderView + PDFKitView für "Der_junge_Hering.pdf" (muss von Andreas hinzugefügt werden)
9. **WICHTIG**: Vorherige Sessions MÜSSEN CLAUDE.md aktualisieren! Diese Session musste 3h Arbeit via git reflog retten weil Doku fehlte.

---

## Sitzungsprotokoll 2026-02-17 (diese Session)

### Was passiert ist
1. **Git-Disaster**: Neue Claude-Session hatte NICHT CLAUDE.md gelesen und wusste nichts vom Buch-Feature (vorherige Session hatte CLAUDE.md nicht aktualisiert!)
2. **Falscher Reset**: Session angenommen, Branch `claude/add-book-reader-Idy0H` sei falsch → `git reset --hard c08b174` → **3h Arbeit gelöscht**
3. **Andreas' Hinweis**: "Wir haben vor 3h ein Buch eingebaut, 3 Tabs (Quiz/Lexikon/Buch)"
4. **Recovery**: Via `git reflog` Commit `6900106` gefunden → `git reset --hard 6900106` → Buch-Feature wiederhergestellt
5. **Quote-Bug**: 833 Compiler-Fehler in LexikonQuizGenerator.swift wegen typografischen Anführungszeichen („") statt ASCII (")
6. **Fix**: Anführungszeichen ersetzt → Build erfolgreich (0 Fehler)
7. **Dokumentation**: CLAUDE.md + PROJECT_STATUS.md aktualisiert mit Buch-Feature

### Wichtig für nächste Session
- **IMMER ZUERST CLAUDE.md LESEN** bevor irgendwas gemacht wird!
- **Jede Session MUSS CLAUDE.md aktualisieren** wenn neue Features hinzukommen
- **Git reflog ist dein Freund** wenn was schiefgeht
- **Nie blind annehmen dass ein Branch falsch ist** – erst checken!

### Gelernter Fehler
| Was schieflief | Warum | Wie verhindern |
|----------------|-------|----------------|
| Session wusste nichts vom Buch-Feature | Vorherige Session hat CLAUDE.md nicht aktualisiert | CLAUDE.md-Update in Checkliste Punkt 9 beachten! |
| 3h Arbeit fast verloren | Blinder `git reset --hard` ohne zu verstehen | IMMER ERST CLAUDE.md lesen, DANN handeln |
| Andreas musste eingreifen | Claude hat nicht nachgefragt | Bei Unsicherheit: Andreas fragen, nicht raten |

---

*Nächste Aktualisierung: Nach nächstem Feature*
