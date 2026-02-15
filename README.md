# Matjes, der kleine Hering

**Das Ausbildungsspiel der Küche** -- *für Köchinnen und Köche*

Matjes ist eine Lern-App für Kochlehrlinge im deutschsprachigen Raum. Die App vermittelt Warenkunde und Küchenwissen durch ein gamifiziertes Quizsystem, das die Ausbildung nach IHK-Rahmenplan begleitet.

---

## Aktueller Stand

Die App ist funktionsfähig und als Beta bei Apple eingereicht. Sie enthält **20 Level** in **4 Halbjahren** mit insgesamt **~566 Quizfragen**, ein integriertes **Lexikon** (Produkte, Garmethoden, Saucen) sowie ein **Prüfungssystem** mit Commis-Prüfung und Bossfight.

---

## Konzept

Lehrlinge durchlaufen **4 Halbjahre** mit steigendem Schwierigkeitsgrad. Die Halbjahre werden sequentiell freigeschaltet. Nach dem 3. Halbjahr wartet die **Commis-Prüfung (Endgegner)**, nach dem 4. Halbjahr der **Bossfight** -- eine simulierte Abschlussprüfung.

### Halbjahr-Struktur

| Block | Level | Inhalt | Freischaltung |
|-------|-------|--------|---------------|
| **1. Halbjahr** | 1--5 | Grundlagen (Hygiene, Küchenbrigade, Warenkunde, Arbeitstechniken) | Immer offen |
| **2. Halbjahr** | 6--10 | Warenkunde (Fleisch, Fisch, Milch, Gewürze, Garmethoden) | Nach Level 5 |
| **3. Halbjahr** | 11--15 | Vertiefung (Saucenkunde, Erkennen, Zuordnen) | Nach Level 10 |
| **Commis-Prüfung** | -- | 30 Fragen / 20 Min. | Nach Level 15 |
| **4. Halbjahr** | 16--20 | Anwenden & Bewerten (Wissen, Praxis, Beurteilung) | Nach Level 15 |
| **Bossfight** | -- | 50 Fragen / 40 Min. | Nach Level 20 |

Halbjahr 5 und 6 (IHK-Erweiterung) sind vorbereitet, aber noch nicht implementiert.

### Level-System

**Level 1--11: Handkuratierte Fragen** (166 Fragen in `Matjes_Fragen_Level1-11.json`)

Manuell erstellte, fachlich geprüfte Quizfragen mit jeweils richtiger Antwort, drei Distraktoren und einer Erklärung bei falscher Antwort.

**Level 12--20: LexikonQuizGenerator** (~400 automatisch generierte Fragen)

Der LexikonQuizGenerator erzeugt Quizfragen direkt aus den Lexikon-Daten und folgt dabei der Bloom-Taxonomie:

| Level | Bloom-Stufe | Beispiel |
|-------|-------------|----------|
| 12--13 | ERKENNEN | "Um welches Produkt handelt es sich?" |
| 14--15 | ZUORDNEN | "Zu welcher Kategorie gehört Rinderfilet?" |
| 16--17 | WISSEN | Lagerung, Allergene, Temperaturen abrufen |
| 18--19 | ANWENDEN | "Ein Gast hat Fischallergie -- was darfst du NICHT verwenden?" |
| 20 | BEWERTEN | "Welche Aussage ist FALSCH?" |

Jedes Level hat 25--70 Fragen im Pool. Pro Spiel werden 10 zufällig ausgewählt.

### Spiel-Mechanik

Jedes Level besteht aus 10 Fragen mit je 4 Antwortmöglichkeiten (A, B, C, D), die bei jedem Start neu gemischt werden. Die Sternebewertung: 0--1 Fehler = 3 Sterne, 2--3 Fehler = 2 Sterne, 4--5 Fehler = 1 Stern, 6+ Fehler = 0 Sterne. Das nächste Level wird ab 1 Stern freigeschaltet. Bei falscher Antwort wird eine Erklärung angezeigt.

### Lexikon

Das integrierte Lexikon dient als Nachschlagewerk und gleichzeitig als Datenquelle für den QuizGenerator:

| Kategorie | Einträge |
|-----------|----------|
| Produkte (Fleisch, Fisch, Milch, Gewürze, Gemüse) | 134 |
| Garmethoden (Kochen, Schmoren, Sous-vide u.v.m.) | 20 |
| Saucen (Muttersoßen, Fonds, Ableitungen, kalte Soßen) | 20 |

---

## Tech Stack

| | |
|---|---|
| Sprache | Swift / SwiftUI |
| Architektur | MVVM |
| iOS-Minimum | 17.0 |
| Externe Abhängigkeiten | Keine |
| Datenhaltung | UserDefaults (Fortschritt), JSON-Bundles (Inhalte) |

---

## Projektstruktur

```
AusbildungsSpielKoch/
├── CLAUDE.md
├── PROJECT_STATUS.md
├── README.md
│
├── AusbildungsSpielKoch/
│   ├── AusbildungsSpielKochApp.swift
│   ├── Models/
│   │   ├── Question.swift
│   │   ├── LevelProgress.swift
│   │   ├── Produkt.swift
│   │   ├── Garmethode.swift
│   │   └── Sauce.swift
│   ├── ViewModels/
│   │   └── GameViewModel.swift
│   ├── Views/
│   │   ├── Main/
│   │   │   ├── MainTabView.swift
│   │   │   ├── StartScreenView.swift
│   │   │   ├── LevelGridView.swift
│   │   │   ├── LevelGameView.swift
│   │   │   └── ResultView.swift
│   │   ├── Lexikon/
│   │   │   ├── LexikonHomeView.swift
│   │   │   ├── ProduktListView.swift / ProduktDetailView.swift
│   │   │   ├── GarmethodeListView.swift / GarmethodeDetailView.swift
│   │   │   └── SauceListView.swift / SauceDetailView.swift
│   │   └── Components/
│   │       └── AnswerButton.swift
│   ├── Helpers/
│   │   ├── QuestionLoader.swift
│   │   ├── LexikonQuizGenerator.swift
│   │   ├── LexikonLoader.swift
│   │   ├── ProgressManager.swift
│   │   └── SoundManager.swift
│   └── Resources/
│       ├── Matjes_Fragen_Level1-11.json (166 Fragen)
│       ├── Koch_Produkte.json (134 Produkte)
│       ├── Koch_Garmethoden.json (20 Garmethoden)
│       ├── Koch_Saucen.json (20 Saucen)
│       ├── Koch_Pruefungskonzept.json
│       └── Audio/ (correct.mp3, wrong.mp3, applaus.wav, click.wav)
│
├── AusbildungsSpielKochTests/
└── AusbildungsSpielKochUITests/
```

---

## Features

**Implementiert:**

- 20 Level in 4 Halbjahren mit sequentieller Freischaltung
- ~566 Quizfragen (166 handkuratiert + ~400 automatisch generiert)
- Bloom-Taxonomie (Erkennen bis Bewerten)
- Commis-Prüfung (Endgegner nach Halbjahr 3)
- Bossfight (Abschlussprüfung nach Halbjahr 4)
- Integriertes Lexikon (Produkte, Garmethoden, Saucen) mit Suche
- Sternebewertung und Fortschrittsspeicherung
- Sound-Feedback und Haptik
- Tab-Navigation (Quiz + Lexikon)
- Offline-Modus

**Geplant:**

- Fortschritts-Dashboard (Stärken/Schwächen)
- Schwachstellen-Training
- Halbjahr 5 + 6 (IHK-Erweiterung)
- Zertifikate (PDF bei bestandener Prüfung)
- Ausbilder-Reports
- Abo-Modell (1 Monat kostenlos, danach Abo)

---

## Zukunftsvision

Karrierepfad: Commis -> Demi-Chef -> Chef de Partie -> Sous-Chef -> Küchenchef

6 Halbjahre nach IHK-Rahmenplan, davon 4 implementiert. Halbjahr 5 und 6 folgen als Erweiterung.

---

## Lizenz

(c) 2026 Andreas Pelczer. Alle Rechte vorbehalten.
