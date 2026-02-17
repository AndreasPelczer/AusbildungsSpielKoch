# CLAUDE.md - Pflichtlektüre für jede neue Claude-Session

> **LIES DIESE DATEI KOMPLETT BEVOR DU IRGENDETWAS TUST.**
> Diese Datei ist das Gedächtnis des Projekts. Sie ersetzt das Onboarding.

---

## 1. Projekt-Überblick

| Feld | Wert |
|------|------|
| **App-Markenname** | **Matjes, der kleine Hering** |
| **Xcode-Projektname** | AusbildungsSpielKoch (nicht ändern!) |
| **Repo** | `AndreasPelczer/AusbildungsSpielKoch` |
| **Zweck** | Quiz-Lernspiel für Koch/Köchin-Azubis (IHK) |
| **Namenserklärung** | Anspielung auf "Der junge Koch" + "Hering" (das Lexikon) |
| **Sprache** | Swift / SwiftUI |
| **Architektur** | MVVM |
| **iOS-Minimum** | 17.0 |
| **Externe Abhängigkeiten** | Keine |
| **Ersteller** | Andreas Pelczer |
| **Team-ID** | F75D7PGFTD |
| **Bundle-ID** | wird von Andreas in Xcode gesetzt |

---

## 2. NAMENSREGELN - KRITISCH

### Verbotene Namen (aus alten Projekten)

| Verboten | Warum |
|----------|-------|
| `millonen` / `millonen.xcodeproj` | Alter Xcode-Projektname, verursachte Icon-Probleme |
| `KitchenMillionaire` | Alter interner Codename |
| `Codiclodi` | Alter Arbeitsname, nicht mehr verwenden |
| `Ausbildungsspiel` (allein, ohne Kontext) | Zu generisch, altes Repo |

### Korrekte Benennung

| Kontext | Name |
|---------|------|
| **In der UI / App Store** | "Matjes, der kleine Hering" oder "Matjes" |
| **Untertitel** | "Das Ausbildungsspiel der Küche" |
| **Xcode-Projekt / Struct** | `AusbildungsSpielKoch` / `AusbildungsSpielKochApp` (nicht ändern!) |
| **Dateipräfix** | `AusbildungsSpielKoch` (Swift-Dateien) oder `Matjes_` (Ressourcen) |
| **Ordnername** | `AusbildungsSpielKoch/` |

---

## 3. Projektstruktur

```
AusbildungsSpielKoch/
├── CLAUDE.md                          ← DU BIST HIER
├── PROJECT_STATUS.md                  ← Aktueller Stand & offene Aufgaben
├── README.md
│
├── AusbildungsSpielKoch/              ← Haupt-App-Ordner
│   ├── AusbildungsSpielKochApp.swift  ← App Entry Point (@main)
│   │
│   ├── Models/
│   │   ├── Question.swift             ← Fragen-Datenmodell
│   │   ├── LevelProgress.swift        ← Fortschritts-Modell (Sterne)
│   │   ├── Produkt.swift              ← Produkt-Datenmodell (Lexikon)
│   │   ├── Garmethode.swift           ← Garmethoden-Datenmodell (Lexikon)
│   │   └── Sauce.swift                ← Saucen-Datenmodell (Lexikon)
│   │
│   ├── ViewModels/
│   │   └── GameViewModel.swift        ← Spiel-Logik (10 Fragen/Level)
│   │
│   ├── Views/
│   │   ├── Main/
│   │   │   ├── MainTabView.swift      ← Tab-Navigation (Quiz + Lexikon + Buch)
│   │   │   ├── StartScreenView.swift  ← Startbildschirm (2 Lehrjahre)
│   │   │   ├── LevelGridView.swift    ← Level-Auswahl (Raster, 20 Level)
│   │   │   ├── LevelGameView.swift    ← Quiz-Spielansicht
│   │   │   ├── ResultView.swift       ← Ergebnis + Sterne + Konfetti
│   │   │   └── BuchReaderView.swift   ← PDF-Reader für "Der junge Hering"
│   │   ├── Lexikon/
│   │   │   ├── LexikonHomeView.swift      ← Lexikon Hauptansicht + Suche
│   │   │   ├── ProduktListView.swift      ← Produkte nach Kategorie
│   │   │   ├── ProduktDetailView.swift    ← Produkt-Detail (Nährwerte etc.)
│   │   │   ├── GarmethodeListView.swift   ← Garmethoden nach Typ
│   │   │   ├── GarmethodeDetailView.swift ← Garmethoden-Detail
│   │   │   ├── SauceListView.swift        ← Saucen nach Typ
│   │   │   └── SauceDetailView.swift      ← Saucen-Detail
│   │   └── Components/
│   │       ├── AnswerButton.swift     ← Wiederverwendbarer Antwort-Button
│   │       └── PDFKitView.swift       ← PDF-Viewer Komponente
│   │
│   ├── Helpers/
│   │   ├── QuestionLoader.swift       ← JSON-Fragen laden & cachen
│   │   ├── LexikonQuizGenerator.swift ← Automatische Fragen (Level 12-20, Bloom)
│   │   ├── LexikonLoader.swift        ← Lexikon-JSON laden (Produkte, Garen, Saucen)
│   │   ├── ProgressManager.swift      ← UserDefaults-Fortschritt
│   │   └── SoundManager.swift         ← Audio + Haptik
│   │
│   ├── Resources/
│   │   ├── Matjes_Fragen_Level1-11.json     ← 166 Fragen (Level 1-11)
│   │   ├── Koch_Produkte.json               ← 134 Produkte
│   │   ├── Koch_Garmethoden.json            ← 20 Garmethoden
│   │   ├── Koch_Saucen.json                 ← 20 Saucen
│   │   ├── Koch_Pruefungskonzept.json       ← Prüfungsstruktur
│   │   ├── Der_junge_Hering.pdf             ← ⚠️ VON ANDREAS MANUELL HINZUFÜGEN (Lehrbuch)
│   │   └── Audio/
│   │       ├── correct.mp3            ← ⚠️ VON ANDREAS MANUELL HINZUFÜGEN
│   │       ├── wrong.mp3              ← ⚠️ VON ANDREAS MANUELL HINZUFÜGEN
│   │       ├── applaus.wav            ← ⚠️ VON ANDREAS MANUELL HINZUFÜGEN
│   │       └── click.wav              ← ⚠️ VON ANDREAS MANUELL HINZUFÜGEN
│   │
│   ├── Assets.xcassets/
│   │   ├── AppIcon.appiconset/        ← App-Icon (1024x1024 PNG)
│   │   ├── AccentColor.colorset/
│   │   └── Contents.json
│   │
│   └── PrivacyInfo.xcprivacy          ← Privacy Manifest (UserDefaults)
│
├── AusbildungsSpielKoch.xcodeproj/    ← Xcode-Projekt (von Andreas erstellt)
│
├── AusbildungsSpielKochTests/
│   └── AusbildungsSpielKochTests.swift
│
└── AusbildungsSpielKochUITests/
    ├── AusbildungsSpielKochUITests.swift
    └── AusbildungsSpielKochUITestsLaunchTests.swift
```

---

## 4. Git-Workflow

### ⚠️ WICHTIGSTE REGEL: Andreas kennt kein Git und will kein Git lernen.
Wenn Andreas ein Git-Problem hat, gib ihm **MAXIMAL EINEN einzigen Befehl** zum Kopieren.
Keine Erklärungen, keine Alternativen, keine mehrstufigen Anleitungen.
Wenn ein Befehl nicht klappt, gib den nächsten EINZELNEN Befehl.

### 🚨 FEHLER AUS VERGANGENEN SESSIONS - NICHT WIEDERHOLEN!
Diese Fehler haben Stunden gekostet. LIES DAS BEVOR DU ANDREAS IRGENDWAS SAGST:

| Fehler | Warum falsch | Was stattdessen |
|--------|-------------|-----------------|
| `git push origin main` wenn Andreas auf claude/-Branch ist | "src refspec main does not match any" - es gibt lokal keinen main Branch | `git push origin HEAD:main` |
| Andreas mehrstufige Git-Befehle geben (stash, rebase, merge) | Er kennt kein Git, das verwirrt und frustriert | EINEN Befehl, der alles macht |
| `git pull` vorschlagen wenn unstaged changes existieren | "cannot pull with rebase: You have unstaged changes" | Erst committen: `git add -A && git commit -m "Update"` dann pullen |
| Mehrere Lösungsvorschläge anbieten | Andreas will EINE Lösung, nicht Optionen | Den besten Befehl geben. Punkt. |
| Davon ausgehen, dass vorherige Sessions Wissen weitergegeben haben | Jede Session startet bei NULL. Kein Gedächtnis. | IMMER diese CLAUDE.md lesen. Alles steht hier. |
| Klug sein wollen statt einfach sein | Komplexe Git-Operationen eskalieren | Der dümmste Befehl der funktioniert ist der beste |
| `git pull origin main` sagen wenn PR noch nicht gemerged ist | "Already up to date" - der Fix liegt nur auf dem Claude-Branch | `git fetch origin claude/BRANCHNAME && git merge origin/claude/BRANCHNAME --no-edit` |

### 4.1 Grundregeln
- **Andreas** arbeitet lokal in Xcode und pusht über Xcode oder einfache Terminal-Befehle
- **Claude** arbeitet auf `claude/`-Branches (Systemvorgabe)
- **Nach jeder fertigen Aufgabe** erstellt Claude einen Pull Request (PR) auf `main`
- **Andreas muss NIE** einen merge, rebase, stash oder conflict resolution machen

### 4.2 Claudes Workflow (JEDE Session)
```
1. git fetch origin main
2. git merge origin/main (eigenen Branch aktuell halten)
3. Aufgabe erledigen
4. Commit + Push auf claude/-Branch
5. PR erstellen mit: gh pr create --base main --title "..." --body "..."
6. Andreas den PR-Link geben → er klickt "Merge" auf GitHub
7. Andreas holt sich den neuen Stand: git pull origin main
```

### 4.3 Wenn Andreas lokale Änderungen hat und pushen will
Claude gibt ihm NUR diesen einen Befehl:
```bash
git add -A && git commit -m "Update" && git push origin HEAD:main
```
Falls "out of date"-Fehler: Erst diesen Befehl, dann nochmal pushen:
```bash
git pull origin main --no-rebase --no-edit
```

### 4.4 Wenn Andreas Claudes Änderungen lokal haben will
NUR dieser eine Befehl:
```bash
git pull origin main
```
(Weil Claude per PR alles auf main merged hat.)

### 4.5 Konflikte
- **Niemals** `--force` oder `--hard` ohne Andreas' explizite Erlaubnis
- Claude löst Konflikte SELBST, niemals Andreas
- Bilder/Assets: Andreas hat Vorrang (er erstellt sie in Xcode)
- Wenn ein Konflikt auf Andreas' Seite entsteht: Claude sagt ihm **einen einzigen Befehl**

---

## 5. App-Architektur Kurzreferenz

### Datenfluss
```
JSON-Datei → QuestionLoader → GameViewModel → Views
                  ↓
          LexikonQuizGenerator (Level 12-20, Bloom-Taxonomie)
                                    ↕
                              ProgressManager → UserDefaults
                              SoundManager → AVAudioPlayer
```

### Level-System (20 Level)
- **2 Lehrjahre**: 1. (Level 1-10), 2. (Level 11-20)
- Level 1-11: Handkuratierte Fragen aus `Matjes_Fragen_Level1-11.json`
- Level 12-20: Automatisch generiert via `LexikonQuizGenerator` (Bloom-Taxonomie)

### Bloom-Taxonomie (Level 12-20)
| Level | Bloom-Stufe | Beschreibung |
|-------|-------------|--------------|
| 12-13 | ERKENNEN | Produkte/Methoden/Saucen identifizieren |
| 14-15 | ZUORDNEN | Kategorien und Typen zuweisen |
| 16-17 | WISSEN | Fakten abrufen (Lagerung, Temperatur, Allergene) |
| 18-19 | ANWENDEN | Praxissituationen lösen |
| 20 | BEWERTEN | Aussagen beurteilen, Fehler erkennen |

### Spiel-Mechanik
- 10 Fragen pro Level (zufällig aus Pool)
- 4 Antworten (A, B, C, D) - werden gemischt
- Sterne: 0-1 Fehler = 3★, 2-3 Fehler = 2★, 4-5 Fehler = 1★, 6+ Fehler = 0★
- Level wird freigeschaltet wenn vorheriges Level ≥ 1★
- Erklärung wird bei falscher Antwort angezeigt

### Fragenbestand
- **Level 1-11**: 166 handkuratierte Fragen (JSON)
- **Level 12-20**: ~400 automatisch generierte Fragen (LexikonQuizGenerator)
- **Gesamt**: ~566 Fragen

### Datenbanken
| Datei | Einträge |
|-------|----------|
| Koch_Produkte.json | 134 Produkte |
| Koch_Garmethoden.json | 20 Garmethoden |
| Koch_Saucen.json | 20 Saucen |

---

## 6. Features

### 6.1 Haupt-Features
- **Quiz-Modus**: 20 Level in 4 Halbjahren, sequentielle Freischaltung
- **Lexikon**: Nachschlagewerk für Produkte, Garmethoden, Saucen
- **Buch-Reader**: PDF-Viewer für "Der junge Hering" (Lehrbuch)

### 6.2 Bekannte Problemstellen

| Problem | Status | Lösung |
|---------|--------|--------|
| App-Icon wird nicht angezeigt im Store | Gelöst | Neues Projekt hat sauberen Asset-Katalog |
| Alte Namens-Relikte im Code | Gelöst | Bei Matjes-Rebranding bereinigt |
| Audio-Dateien fehlen noch im Repo | Offen | Andreas muss sie manuell hinzufügen |
| PDF "Der_junge_Hering.pdf" fehlt noch | Offen | Andreas muss es manuell hinzufügen |
| Prüfungsmodul (Commis-Prüfung, Bossfight) | Offen | Nächstes Feature |

---

## 7. Checkliste für neue Claude-Sessions

Jede neue Session sollte folgende Schritte durchführen:

```
□ 1. CLAUDE.md lesen (diese Datei)
□ 2. PROJECT_STATUS.md lesen (aktueller Stand)
□ 3. git fetch origin main && git merge origin/main (IMMER zuerst synchronisieren!)
□ 4. Eigenen claude/-Branch erstellen (falls nötig)
□ 5. Aufgabe erledigen
□ 6. Commit + Push auf claude/-Branch
□ 7. PR erstellen auf main (gh pr create)
□ 8. Andreas den PR-Link geben
□ 9. PROJECT_STATUS.md aktualisieren
```

### WICHTIG: Am Ende IMMER einen PR erstellen!
Claude lässt Andreas NIEMALS mit Branch-Wirrwarr allein.
Der PR-Link ist das Ergebnis. Andreas klickt "Merge". Fertig.

---

## 8. Kontakt & Entscheidungen

- **Bilder/Icons/Assets:** Immer Andreas fragen - er erstellt sie in Xcode
- **Code-Struktur:** Claude kann eigenständig entscheiden (MVVM beibehalten)
- **Neue Features:** Mit Andreas absprechen
- **Destructive Git-Ops:** Niemals ohne explizite Erlaubnis

---

## 9. Zukunftsvision (von Andreas)

> "Matjes, der kleine Hering – Das Ausbildungsspiel der Küche"

- **6 Halbjahre** nach IHK-Rahmenplan
- **Commis-Prüfung** = Endgegner (Ende jedes Halbjahres)
- **Bossfight** = Abschlussprüfung (80 Fragen / 60 Min.)
- **Fortschritts-Dashboard** – Stärken/Schwächen
- **Schwachstellen-Training** – Gezieltes Üben
- **Zertifikate** – PDF bei bestandener Prüfung
- **Ausbilder-Reports** – Automatische Fortschrittsberichte
- **Abo-Modell** – 1 Monat kostenlos, danach monatlich/jährlich

---

*Letzte Aktualisierung: 2026-02-17*
*Session: claude/add-book-reader-Idy0H (Buch-Feature + Quote-Fix)*
