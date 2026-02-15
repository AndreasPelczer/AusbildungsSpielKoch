# CLAUDE.md - Pflichtlektüre für jede neue Claude-Session

> **LIES DIESE DATEI KOMPLETT BEVOR DU IRGENDETWAS TUST.**
> Diese Datei ist das Gedächtnis des Projekts. Sie ersetzt das Onboarding.

---

## 1. Projekt-Überblick

| Feld | Wert |
|------|------|
| **App-Name** | AusbildungsSpielKoch |
| **Repo** | `AndreasPelczer/AusbildungsSpielKoch` |
| **Zweck** | Quiz-Lernspiel für Koch/Köchin-Azubis (IHK) |
| **Sprache** | Swift / SwiftUI |
| **Architektur** | MVVM |
| **iOS-Minimum** | 17.0 |
| **Externe Abhängigkeiten** | Keine |
| **Ersteller** | Andreas Pelczer |
| **Team-ID** | F75D7PGFTD |
| **Bundle-ID** | wird von Andreas in Xcode gesetzt |

---

## 2. VERBOTENE NAMEN - KRITISCH

Diese Namen stammen aus alten Projekten und dürfen **NIRGENDWO** mehr auftauchen:

| Verboten | Warum |
|----------|-------|
| `millonen` / `millonen.xcodeproj` | Alter Xcode-Projektname, verursachte Icon-Probleme |
| `KitchenMillionaire` | Alter interner Codename |
| `Matjes` | Alter App-Markenname (nur noch als Icon-Dateiname ok) |
| `Ausbildungsspiel` (ohne "Koch"/"SpielKoch") | Altes Repo, nicht mehr aktiv |

**Korrekte Benennung:**
- App-Struct: `AusbildungsSpielKochApp`
- Dateipräfix: `AusbildungsSpielKoch`
- Ordnername: `AusbildungsSpielKoch/`
- In UI-Texten: "Ausbildungsspiel Koch" oder "Küchenfachkunde Quiz"

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
│   │   │   ├── MainTabView.swift      ← Tab-Navigation (Quiz + Lexikon)
│   │   │   ├── StartScreenView.swift  ← Startbildschirm (3 Lehrjahre)
│   │   │   ├── LevelGridView.swift    ← Level-Auswahl (Raster)
│   │   │   ├── LevelGameView.swift    ← Quiz-Spielansicht
│   │   │   └── ResultView.swift       ← Ergebnis + Sterne + Konfetti
│   │   ├── Lexikon/
│   │   │   ├── LexikonHomeView.swift      ← Lexikon Hauptansicht + Suche
│   │   │   ├── ProduktListView.swift      ← Produkte nach Kategorie
│   │   │   ├── ProduktDetailView.swift    ← Produkt-Detail (Nährwerte etc.)
│   │   │   ├── GarmethodeListView.swift   ← Garmethoden nach Typ
│   │   │   ├── GarmethodeDetailView.swift ← Garmethoden-Detail
│   │   │   ├── SauceListView.swift        ← Saucen nach Typ
│   │   │   └── SauceDetailView.swift      ← Saucen-Detail
│   │   └── Components/
│   │       └── AnswerButton.swift     ← Wiederverwendbarer Antwort-Button
│   │
│   ├── Helpers/
│   │   ├── QuestionLoader.swift       ← JSON-Fragen laden & cachen
│   │   ├── LexikonLoader.swift        ← Lexikon-JSON laden (Produkte, Garen, Saucen)
│   │   ├── ProgressManager.swift      ← UserDefaults-Fortschritt
│   │   └── SoundManager.swift         ← Audio + Haptik
│   │
│   ├── Resources/
│   │   ├── iMOPS_Koch_Fragen_Level1-3.json  ← 166 Fragen (Level 1-11)
│   │   ├── Koch_Produkte.json               ← 134 Produkte
│   │   ├── Koch_Garmethoden.json            ← 20 Garmethoden
│   │   ├── Koch_Saucen.json                 ← 20 Saucen
│   │   ├── Koch_Pruefungskonzept.json       ← Prüfungsstruktur
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
                                    ↕
                              ProgressManager → UserDefaults
                              SoundManager → AVAudioPlayer
```

### Spiel-Mechanik
- 3 Lehrjahre: 1. (Level 1-10), 2. (Level 11-20), 3. (Level 21-30)
- 10 Fragen pro Level (zufällig aus Pool)
- 4 Antworten (A, B, C, D) - werden gemischt
- Sterne: 0-1 Fehler = 3★, 2-3 Fehler = 2★, 4-5 Fehler = 1★, 6+ Fehler = 0★
- Level wird freigeschaltet wenn vorheriges Level ≥ 1★
- Erklärung wird bei falscher Antwort angezeigt

### Aktueller Fragenbestand
- Level 1: 15 Fragen (Hygiene & Lebensmittelsicherheit)
- Level 2: 15 Fragen (Küchenbrigade & Arbeitsabläufe)
- Level 3: 15 Fragen (Warenkunde & Schnitttechniken)
- Level 4-30: Noch keine Fragen vorhanden

---

## 6. Bekannte Problemstellen

| Problem | Status | Lösung |
|---------|--------|--------|
| App-Icon wird nicht angezeigt im Store | Gelöst durch Neustart | Neues Projekt hat sauberen Asset-Katalog |
| Alte Namens-Relikte im Code | Gelöst | Bei Code-Migration bereinigt |
| Nur 3 von 30 Leveln haben Fragen | Offen | Fragen-JSON erweitern |
| Audio-Dateien fehlen noch im Repo | Offen | Andreas muss sie manuell hinzufügen |

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

*Letzte Aktualisierung: 2026-02-15*
*Session: claude/setup-chef-quiz-game-Jyg7i*
