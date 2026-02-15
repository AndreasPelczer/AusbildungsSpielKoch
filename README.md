
# Matjes, der kleine Hering

**Das Ausbildungsspiel der Küche für Köchinnen und Köche**

Codiclodi ist eine Lern-App für Kochlehrlinge im deutschsprachigen Raum. Die App vermittelt Warenkunde und Küchenwissen durch ein gamifiziertes Quizsystem, das die dreijährige Ausbildung nach IHK-Rahmenplan begleitet.

---

## Konzept

Lehrlinge durchlaufen **6 Halbjahre** mit steigendem Schwierigkeitsgrad. Jedes Halbjahr endet mit einer Prüfung. Am Ende der Ausbildung wartet der **Bossfight** – eine simulierte Abschlussprüfung über alle Kategorien und Level.

### Fragenlevel (Bloom-Taxonomie)

| Level | Bezeichnung | Beschreibung |
|-------|-------------|--------------|
| 1 | Erkennen | Produkt anhand von Bild oder Name identifizieren |
| 2 | Zuordnen | Produkt einer Kategorie oder Eigenschaft zuordnen |
| 3 | Wissen | Fakten zu Lagerung, Herkunft, Saison abrufen |
| 4 | Anwenden | Verwendung und Garmethoden begründen |
| 5 | Bewerten | Qualität beurteilen, Alternativen empfehlen |

### Produktkategorien

| Kategorie | Produkte | Beschreibung |
|-----------|----------|--------------|
| Fleisch | 25 | Rind, Kalb, Schwein, Lamm, Wild, Geflügel, Innereien |
| Fisch & Meeresfrüchte | 24 | Süß-/Salzwasserfische, Schalen- und Krustentiere |
| Milchprodukte | 24 | Trinkmilch, Rahm, Käse, Sauermilchprodukte |
| Gewürze | 25 | Küchengewürze von Pfeffer bis Safran |
| Garmethoden | 20 | Kochen, Schmoren, Sous-vide, Konfieren u.v.m. |
| Saucenkunde | 20 | Muttersoßen, Fonds, Ableitungen, kalte Soßen |

**Gesamt:** 138 Produkte/Methoden, 240+ Quizfragen

### Prüfungssystem

| Prüfung | Zeitpunkt | Format |
|---------|-----------|--------|
| Commis-Prüfung (Endgegner) | Ende jedes Halbjahres | Zwischenprüfung über bisherige Inhalte |
| Bossfight | Ende der Ausbildung | 80 Fragen / 60 Min. über alle Kategorien |

---

## Tech Stack

*In Planung – Details folgen.*

## Architektur

### Datenbank

```
codiclodi_produkte
├── kategorien          # Produktkategorien
├── produkte            # Alle Lebensmittel, Methoden, Soßen
├── fragen              # Quizfragen mit Level-Zuordnung
├── lehrling_profil     # Profil und Lehrjahr
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

- **LexikonQuizGenerator** – Generiert 9 Levels mit Bloom-Taxonomie automatisch
- **Gamification** – Punkte, Level-Freischaltung, Endgegner-Prüfungen, Bossfight
- **Fortschritts-Dashboard** – Stärken/Schwächen auf einen Blick
- **Schwachstellen-Training** – Gezieltes Üben nach Prüfungen
- **Zertifikate** – PDF-Download bei bestandener Prüfung
- **Ausbilder-Reports** – Automatische Fortschrittsberichte
- **Offline-Modus** – Lernen ohne Internetverbindung (Mobile App)

---

## Monetarisierung

- 1 Monat kostenlos testen (Vollzugang)
- Danach Abo-Modell (monatlich/jährlich)
- Zielgruppe: Lehrlinge, Ausbildungsbetriebe, Berufsschulen

---

## App Store

Verfügbar für iOS (geplant). Kategorie: Bildung / Essen & Trinken.

---

## Dokumentation

| Dokument | Inhalt |
|----------|--------|
| `Codiclodi_Produktdatenbank.docx` | Alle Produktkategorien + Datenbankkonzept |
| `Codiclodi_Quizfragen.docx` | 160 Quizfragen (Fleisch, Fisch, Milch, Gewürze) |
| `Codiclodi_Level9_10_Pruefungen.docx` | Garmethoden, Saucenkunde + Prüfungskonzept |
| `Codiclodi_AppStore_Beschreibung.md` | Apple App Store Texte |

---

## Roadmap

- [x] Produktkategorien definieren (Fleisch, Fisch, Milch, Gewürze)
- [x] Quizfragen Level 1–5 erstellen (160 Fragen)
- [x] Garmethoden (Level 9) ausarbeiten
- [x] Saucenkunde (Level 10) ausarbeiten
- [x] Prüfungskonzept (Commis-Prüfung + Bossfight)
- [x] App Store Beschreibung
- [ ] Fachliches OK für Level 4+5 Fragen
- [ ] LexikonQuizGenerator bauen (9 Levels, Bloom-Taxonomie)
- [ ] 6 Halbjahre nach IHK-Rahmenplan strukturieren
- [ ] UI/UX Design
- [ ] Backend + Datenbank aufsetzen
- [ ] App-Entwicklung (iOS)
- [ ] Testphase mit Lehrlingen
- [ ] App Store Launch

---

## Lizenz

© 2026 Andreas Pelczer. Alle Rechte vorbehalten.
