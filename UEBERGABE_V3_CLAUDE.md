# CLAUDE.md - Pflichtlektuere fuer jede neue Claude-Session

> **LIES DIESE DATEI KOMPLETT BEVOR DU IRGENDETWAS TUST.**
> Diese Datei ist das Gedaechtnis des Projekts. Sie ersetzt das Onboarding.

---

## 1. Das Gesamtbild: 3 Versionen von Matjes

"Matjes, der kleine Hering" ist ein Quiz-Lernspiel fuer Koch/Koechin-Azubis (IHK).
Es gibt **3 Versionen** – alle basieren auf der gleichen Wissensbasis:

| Version | Zielgruppe | Status | Repo |
|---------|-----------|--------|------|
| **V1 - Kostenlos** | Azubis (1. Lehrjahr) | **Im App Store** | `AndreasPelczer/AusbildungsSpielKoch` |
| **V2 - Einzelperson** | Azubis (alle Lehrjahre) | In Entwicklung | `AndreasPelczer/AusbildungsSpielKoch` |
| **V3 - Schulen/Ausbilder** | Berufsschulen, Ausbilder, Pruefer | **DIESES REPO** | *(dieses Repo)* |

### V1 + V2 (bestehendes Matjes-Projekt)
- **20 Level** in **4 Halbjahren** (je 5 Level)
- **~566 Fragen** (166 handkuratiert + ~400 automatisch generiert)
- Bloom-Taxonomie: Erkennen → Zuordnen → Wissen → Anwenden → Bewerten
- Sterne-System (0-3 Sterne pro Level)
- Commis-Pruefung (nach Halbjahr 3) + Bossfight (nach Halbjahr 4)
- **Lexikon**: 134 Produkte, 20 Garmethoden, 20 Saucen
- Lokaler Fortschritt via UserDefaults
- **Reine Single-User-App, kein Backend, kein Cloud**

### V3 (DIESES PROJEKT) - Was es zusaetzlich koennen soll
- **Ausbilder-Modus**: Eigene Fragenkataloge erstellen und verwalten
- **Klassen-/Gruppenverwaltung**: Mehrere Schueler verwalten
- **Lernfortschritte verfolgen**: Ausbilder sehen den Fortschritt jedes Schuelers
- **Reports/Export**: Automatische Fortschrittsberichte (PDF)
- **Abo-Modell**: 1 Monat kostenlos, danach monatlich/jaehrlich
- **Basierend auf**: iMOPS-Gastro-Grid (bestehendes Projekt von Andreas)

---

## 2. NAMENSREGELN - KRITISCH

### Verbotene Namen

| Verboten | Warum |
|----------|-------|
| `millonen` / `millonen.xcodeproj` | Alter Xcode-Projektname |
| `KitchenMillionaire` | Alter Codename |
| `Codiclodi` | Alter Arbeitsname |

### Korrekte Benennung

| Kontext | Name |
|---------|------|
| **In der UI / App Store** | "Matjes, der kleine Hering" oder "Matjes" |
| **Untertitel** | "Das Ausbildungsspiel der Kueche" |
| **V3-Zusatz** | "Profi-Edition" oder "Schulversion" |

---

## 3. Technische Basis aus iMOPS-Gastro-Grid

Das Gastro-Grid Projekt bringt folgende Komponenten mit, die fuer V3 relevant sind:

### Projektstruktur (aus Gastro-Grid)
```
iMOPS-Gastro-Grid/
├── App/                    ← App Entry Point
├── ChefIQ/                 ← Quiz/Wissens-Komponente (KERN-FEATURE!)
├── EventSourcing/          ← Event-basierte Datenverwaltung
├── Export/                 ← Report-Export (PDF etc.)
├── Kernel/                 ← Kern-Logik
├── Persistence/            ← CoreData Models
│   ├── Auftrag             ← Auftraege/Orders
│   ├── CDIngredient         ← Zutaten
│   ├── CDLexikonEntry       ← Lexikon-Eintraege
│   ├── CDProduct            ← Produkte
│   ├── Employee             ← Mitarbeiter (→ Schueler/Azubis!)
│   ├── Event                ← Events
│   ├── HACCPRecord          ← HACCP-Protokolle
│   └── SOPDocument          ← Standard-Operating-Procedures
├── Resources/              ← Ressourcen
├── Security/               ← Sicherheit/Auth
├── Services/               ← Business-Logik Services
├── UI/                     ← SwiftUI Views
├── README.md
└── STRUCTURE.md            ← Projektstruktur-Doku
```

### Was aus Gastro-Grid uebernommen werden kann
| Gastro-Grid Modul | V3 Verwendung |
|-------------------|---------------|
| **ChefIQ/** | Quiz-Engine → Matjes-Fragen integrieren |
| **Persistence/** (CoreData) | Schueler-/Fortschrittsdaten speichern |
| **Employee** | → Schueler/Azubi-Verwaltung |
| **Export/** | → Fortschrittsberichte als PDF |
| **Security/** | → Login fuer Ausbilder |
| **EventSourcing/** | → Lernfortschritt tracken |
| **CDLexikonEntry** | → Bestehendes Lexikon (Produkte, Garmethoden, Saucen) |

### Was aus Matjes (V1/V2) uebernommen werden soll
| Matjes-Komponente | V3 Verwendung |
|-------------------|---------------|
| **Matjes_Fragen_Level1-11.json** | 166 handkuratierte Fragen |
| **Koch_Produkte.json** | 134 Produkte |
| **Koch_Garmethoden.json** | 20 Garmethoden |
| **Koch_Saucen.json** | 20 Saucen |
| **LexikonQuizGenerator.swift** | Automatische Fragengenerierung (Bloom-Taxonomie) |
| **Sterne-System + Level-Logik** | Gamification beibehalten |

---

## 4. Architektur-Vorgaben

| Feld | Wert |
|------|------|
| **Sprache** | Swift / SwiftUI |
| **Architektur** | MVVM |
| **iOS-Minimum** | 17.0 |
| **Persistenz** | CoreData (aus Gastro-Grid) |
| **Backend** | Noch offen (CloudKit? Firebase? Eigener Server?) |
| **Externe Abhaengigkeiten** | Moeglichst keine |
| **Ersteller** | Andreas Pelczer |
| **Team-ID** | F75D7PGFTD |

---

## 5. Feature-Anforderungen V3

### Must-Have (MVP)
1. **Ausbilder-Login**: Ausbilder kann sich einloggen
2. **Klassen erstellen**: Ausbilder erstellt Klassen und laedt Schueler ein
3. **Fragenkatalog verwalten**: Ausbilder kann eigene Fragen erstellen/bearbeiten
4. **Fortschritt einsehen**: Dashboard mit Fortschritt pro Schueler
5. **Alle Matjes-Inhalte**: Fragen, Lexikon, Level-System, Bloom-Taxonomie

### Nice-to-Have
6. **PDF-Reports**: Fortschrittsberichte exportieren
7. **Schwachstellen-Analyse**: Wo hat ein Schueler Luecken?
8. **Zertifikate**: PDF bei bestandener Pruefung
9. **Push-Benachrichtigungen**: Erinnerungen ans Lernen

### Spaeter
10. **Abo-Modell**: 1 Monat kostenlos, dann Abo
11. **Halbjahr 5+6**: IHK-Erweiterung (noch nicht in V1/V2)
12. **Ausbilder-Reports**: Automatische Berichte ans Ausbildungsunternehmen

---

## 6. Git-Workflow

### WICHTIGSTE REGEL: Andreas kennt kein Git und will kein Git lernen.
Wenn Andreas ein Git-Problem hat, gib ihm **MAXIMAL EINEN einzigen Befehl** zum Kopieren.

### FEHLER DIE NICHT WIEDERHOLT WERDEN DUERFEN

| Fehler | Was stattdessen |
|--------|-----------------|
| `git push origin main` wenn auf claude/-Branch | `git push origin HEAD:main` |
| Mehrstufige Git-Befehle | EINEN Befehl der alles macht |
| `git pull` wenn unstaged changes existieren | Erst committen: `git add -A && git commit -m "Update"` |
| Mehrere Loesungsvorschlaege | Den besten Befehl. Punkt. |

### Claudes Workflow
```
1. git fetch origin main
2. git merge origin/main
3. Aufgabe erledigen
4. Commit + Push auf claude/-Branch
5. PR erstellen: gh pr create --base main --title "..." --body "..."
6. Andreas den PR-Link geben → er klickt "Merge"
7. Andreas holt sich den Stand: git pull origin main
```

### Wenn Andreas lokale Aenderungen pushen will
```bash
git add -A && git commit -m "Update" && git push origin HEAD:main
```

---

## 7. Erste Aufgabe fuer den neuen Chat

1. **STRUCTURE.md und README.md im Gastro-Grid Repo lesen** – Verstehen was da ist
2. **ChefIQ/ Modul analysieren** – Kann das die Matjes-Quiz-Engine ersetzen/erweitern?
3. **Persistence/ analysieren** – Welche CoreData-Models koennen wiederverwendet werden?
4. **Plan erstellen**: Wie wird aus Gastro-Grid + Matjes-Daten die V3?
5. **Andreas fragen**: Backend-Entscheidung (CloudKit vs. Firebase vs. eigener Server)

---

## 8. Kontakt & Entscheidungen

- **Bilder/Icons/Assets:** Immer Andreas fragen
- **Code-Struktur:** Claude kann eigenstaendig entscheiden (MVVM beibehalten)
- **Neue Features:** Mit Andreas absprechen
- **Destructive Git-Ops:** Niemals ohne explizite Erlaubnis
- **Backend-Wahl:** Andreas muss entscheiden

---

## 9. Bestehende Wissensbasis (zum Kopieren ins neue Repo)

Diese Dateien aus dem Matjes-Repo (`AndreasPelczer/AusbildungsSpielKoch`) sollten in V3 integriert werden:

```
Resources/
├── Matjes_Fragen_Level1-11.json     ← 166 handkuratierte Fragen
├── Koch_Produkte.json               ← 134 Produkte
├── Koch_Garmethoden.json            ← 20 Garmethoden
├── Koch_Saucen.json                 ← 20 Saucen
└── Koch_Pruefungskonzept.json       ← Pruefungsstruktur

Helpers/
├── LexikonQuizGenerator.swift       ← Automatische Fragengenerierung (Bloom)
└── QuestionLoader.swift             ← JSON-Fragen laden

Models/
├── Question.swift                   ← Fragen-Datenmodell
├── Produkt.swift                    ← Produkt-Datenmodell
├── Garmethode.swift                 ← Garmethoden-Datenmodell
└── Sauce.swift                      ← Saucen-Datenmodell
```

---

*Erstellt: 2026-02-17*
*Von: Claude-Session im Matjes-Repo (AusbildungsSpielKoch)*
*Zweck: Uebergabe an neuen Claude-Chat fuer V3 (Schulversion)*
