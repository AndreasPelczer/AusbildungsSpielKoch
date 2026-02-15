# Matjes, der kleine Hering 🐟

**Das Ausbildungsspiel der Küche**

*für Köchinnen und Köche*

Matjes ist eine Lern-App für Kochlehrlinge im deutschsprachigen Raum. Die App vermittelt Warenkunde und Küchenwissen durch ein gamifiziertes Quizsystem, das die zweijährige Ausbildung (4 Halbjahre) nach IHK-Rahmenplan begleitet.

---

## Konzept

Lehrlinge durchlaufen **2 Lehrjahre (4 Halbjahre)** mit steigendem Schwierigkeitsgrad. Jedes Halbjahr endet mit einer **Commis-Prüfung (Endgegner)**. Am Ende der Ausbildung wartet der **Bossfight** – eine simulierte Abschlussprüfung über alle Kategorien und Level.

### Level-System

Matjes hat **20 Level** in zwei Blöcken:

#### Level 1–11: Handkuratierte Fragen

Manuell erstellte, fachlich geprüfte Quizfragen mit jeweils richtiger Antwort und Distraktoren.

| Level | Bloom-Stufe | Inhalt |
|-------|-------------|--------|
| 1–5 | Erkennen → Bewerten | Fleisch (25 Produkte) |
| 1–5 | Erkennen → Bewerten | Fisch & Meeresfrüchte (24 Produkte) |
| 1–5 | Erkennen → Bewerten | Milchprodukte (24 Produkte) |
| 1–5 | Erkennen → Bewerten | Gewürze (25 Produkte) |
| 1–5 | Erkennen → Bewerten | Garmethoden (20 Methoden) |
| 1–5 | Erkennen → Bewerten | Saucenkunde (20 Soßen) |

**Gesamt:** 138 Produkte/Methoden, 240+ handgeschriebene Fragen

#### Level 12–20: LexikonQuizGenerator (automatisch)

Der LexikonQuizGenerator erzeugt automatisch **~400 Quizfragen** aus den Lexikon-Daten:

| Level | Bloom-Stufe | Was wird gefragt? |
|-------|-------------|-------------------|
| 12 | ERKENNEN | "Um welches Produkt handelt es sich?" (aus Beschreibung) |
| 13 | ERKENNEN | "Welche Sauce hat diese Basis?" / "Welche Garmethode?" |
| 14 | ZUORDNEN | "Zu welcher Kategorie gehört Rinderfilet?" |
| 15 | ZUORDNEN | "Welcher Typ Garmethode ist Pochieren?" |
| 16 | WISSEN | Lagerung, Allergene, Nährwerte abrufen |
| 17 | WISSEN | Temperaturen, Garmedien, Saucen-Basis |
| 18 | ANWENDEN | "Ein Gast hat Fischallergie – was darfst du NICHT verwenden?" |
| 19 | ANWENDEN | Ableitungen, Praxistipps, Klassiker (Spargel → Hollandaise) |
| 20 | BEWERTEN | "Welche Aussage ist FALSCH?" / "NICHT geeignet für..." |

**So funktioniert der Generator:**
- Jedes Level hat **25–70 Fragen** im Pool
- Bei jedem Spielstart werden **10 zufällig** ausgewählt
- Bei App-Neustart → komplett neue Fragen-Mischung

**Daten-Datei:** `Matjes_Fragen_Level1-11.json`

### Produktkategorien (Datenbasis)

| Kategorie | Einträge | Beschreibung |
|-----------|----------|--------------|
| Fleisch | 25 | Rind, Kalb, Schwein, Lamm, Wild, Geflügel, Innereien |
| Fisch & Meeresfrüchte | 24 | Süß-/Salzwasserfische, Schalen- und Krustentiere |
| Milchprodukte | 24 | Trinkmilch, Rahm, Käse, Sauermilchprodukte |
| Gewürze | 25 | Küchengewürze von Pfeffer bis Safran |
| Garmethoden | 20 | Kochen, Schmoren, Sous-vide, Konfieren u.v.m. |
| Saucenkunde | 20 | Muttersoßen, Fonds, Ableitungen, kalte Soßen |

**Gesamt:** 138 Einträge → **640+ Quizfragen** (240+ manuell + ~400 generiert)

### Prüfungssystem

| Prüfung | Zeitpunkt | Format |
|---------|-----------|--------|
| Commis-Prüfung (Endgegner) | Ende jedes Halbjahres (4×) | Zwischenprüfung über bisherige Inhalte |
| Bossfight (Abschlussprüfung) | Ende der Ausbildung (2. Lehrjahr) | 80 Fragen / 60 Min. über alle Kategorien und Level |

---

## Tech Stack

*In Entwicklung – Branch: `claude/setup-chef-quiz-game-Jyg7i`*

iOS (Swift/Xcode)

---

## Architektur

### Datenbank

```
matjes_produkte
├── kategorien          # Produktkategorien
├── produkte            # Alle Lebensmittel, Methoden, Soßen
├── fragen              # Handkuratierte Quizfragen (Level 1–11)
├── fragen_generated    # Generierte Quizfragen (Level 12–20)
├── lehrling_profil     # Profil und Lehrjahr/Halbjahr
├── fortschritt         # Lernfortschritt pro Kategorie/Level
└── quiz_historie       # Protokoll aller Antworten
```

### Rollen

| Rolle | Rechte |
|-------|--------|
| Lehrling | Quiz spielen, eigenen Fortschritt einsehen |
| Ausbilder/in | Fortschritt aller Lehrlinge einsehen, Berichte exportieren |
| Administrator | Produkte, Fragen und Kategorien verwalten |

---

## Features

- 🐟 **Matjes-Maskottchen** – "Matjes, der kleine Hering" begleitet durch die App
- **LexikonQuizGenerator** – Erzeugt ~400 Fragen aus Lexikon-Daten (Level 12–20, Bloom-Taxonomie)
- **20 Level** – 11 handkuratiert + 9 automatisch generiert
- **Gamification** – Punkte, Level-Freischaltung, Endgegner (Commis-Prüfung), Bossfight (Abschlussprüfung)
- **Zufalls-Modus** – 10 zufällige Fragen pro Spielstart, nie dieselbe Mischung
- **Fortschritts-Dashboard** – Stärken/Schwächen auf einen Blick
- **Schwachstellen-Training** – Gezieltes Üben nach Prüfungen
- **Zertifikate** – PDF-Download bei bestandener Prüfung
- **Ausbilder-Reports** – Automatische Fortschrittsberichte
- **Offline-Modus** – Lernen ohne Internetverbindung

---

## Monetarisierung

- 1 Monat kostenlos testen (Vollzugang)
- Danach Abo-Modell (monatlich/jährlich)
- Zielgruppe: Lehrlinge, Ausbildungsbetriebe, Berufsschulen

---

## App Store

Verfügbar für iOS (geplant). Kategorie: Bildung / Essen & Trinken.

---

## Xcode-Setup nach Merge

Nach dem Merge von `claude/setup-chef-quiz-game-Jyg7i` in Xcode:

1. Alte JSON-Referenz `iMOPS_Koch_Fragen_Level1-3.json` entfernen
2. Neue `Matjes_Fragen_Level1-11.json` per Drag & Drop ins Projekt ziehen

---

## Dokumentation

| Dokument | Inhalt |
|----------|--------|
| `Matjes_Produktdatenbank.docx` | Alle Produktkategorien + Datenbankkonzept |
| `Matjes_Quizfragen.docx` | 160 handkuratierte Quizfragen (Fleisch, Fisch, Milch, Gewürze) |
| `Matjes_Level9_10_Pruefungen.docx` | Garmethoden, Saucenkunde + Prüfungskonzept |
| `Matjes_AppStore_Beschreibung.md` | Apple App Store Texte |

---

## Roadmap

### Erledigt
- [x] Produktkategorien definieren (Fleisch, Fisch, Milch, Gewürze)
- [x] Quizfragen Level 1–5 erstellen (160 Fragen)
- [x] Garmethoden (Level 9) ausarbeiten
- [x] Saucenkunde (Level 10) ausarbeiten
- [x] Prüfungskonzept (Commis-Prüfung + Bossfight)
- [x] App Store Beschreibung + Copyright
- [x] LexikonQuizGenerator bauen (Level 12–20, ~400 Fragen)
- [x] Rebranding: Codiclodi → Matjes, der kleine Hering
- [x] JSON umbenannt: `Matjes_Fragen_Level1-11.json`
- [x] Startbildschirm mit Matjes-Maskottchen
- [x] Branch gepusht: `claude/setup-chef-quiz-game-Jyg7i`

### Offen
- [ ] PR erstellen und mergen
- [ ] Xcode: alte JSON-Referenz entfernen, neue einbinden
- [ ] Fachliches OK für Level 4+5 Fragen
- [ ] 4 Halbjahre nach IHK-Rahmenplan strukturieren
- [ ] UI/UX Design
- [ ] Testphase mit Lehrlingen
- [ ] App Store Launch

---

## Lizenz

© 2026 Andreas Pelczer. Alle Rechte vorbehalten.
