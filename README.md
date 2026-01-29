# Musik Radar - n8n Workflow

Ein automatisierter n8n Workflow zur Aggregation, Analyse und Versendung von Musik-Rezensionen aus verschiedenen Online-Quellen.

## Übersicht

Der **Musik Radar** Workflow sammelt automatisch neue Album-Rezensionen von verschiedenen Musikmagazinen, fasst diese mithilfe von KI zusammen und versendet personalisierte E-Mail-Digests an Abonnenten. Der Workflow nutzt OpenAI zur intelligenten Zusammenfassung und kategorisiert die Musikrichtungen automatisch.

## Funktionen

### Datenquellen
- **Laut.de** - RSS-Feed für deutsche Musikrezensionen
- **Resident Advisor** - Spezielle Rezensionen und Advisor-Picks
- **MusikExpress** - HTTP-basierte Rezensionsabfrage

### Kernfunktionalität
1. **Automatische Rezensionssammlung** - Abruf neuer Rezensionen über RSS und Sitemaps
2. **KI-gestützte Zusammenfassung** - OpenAI GPT-4.1-mini erstellt prägnante Zusammenfassungen (max. 1000 Zeichen)
3. **Genre-Erkennung** - Automatische Identifikation der Musikrichtung
4. **Apple Music Integration** - Automatische Verlinkung zu Apple Music-Alben mit Cover-Artwork
5. **Duplikatserkennung** - Prüfung auf bereits verarbeitete Rezensionen
6. **Datenbankpersistenz** - Speicherung in MySQL-Datenbank
7. **E-Mail-Versand** - Personalisierte Digests an registrierte Empfänger

## Technische Anforderungen

### Credentials
Der Workflow benötigt folgende Zugangsdaten:

1. **OpenAI API** - Für die KI-gestützte Textanalyse
2. **Apple Music API** - Bearer Token für Album-Suche
3. **MySQL Datenbank** - Für Rezensionsspeicherung und Empfängerverwaltung
4. **SMTP Account** - Für E-Mail-Versand

### Datenbank-Schema
Die MySQL-Datenbank sollte mindestens folgende Tabellen enthalten:
- Reviews-Tabelle (title, content, link, lastmod, etc.)
- Recipients-Tabelle (E-Mail-Adressen)
- Last-Send-Tabelle (Tracking des letzten Versandzeitpunkts)

## Workflow-Struktur

### Trigger
- **Get Data Trigger** - Zeitgesteuerter Abruf neuer Rezensionen
- **Send Mail Trigger** - Zeitgesteuerter E-Mail-Versand
- **Manual Trigger** - Manuelle Ausführung für Tests

### Hauptkomponenten

#### 1. Datensammlung
```
RSS/HTTP Requests → XML Parser → Filter & Sort → Duplikatsprüfung
```

#### 2. Content-Verarbeitung
```
Extract Text → AI Agent (OpenAI) → Zusammenfassung + Genre
```

#### 3. Apple Music Integration
```
Request Album Details → Parse Response → Extract Links & Cover
```

#### 4. Persistierung & Versand
```
Save to MySQL → Build Email Content → Send to Recipients
```

## AI-Prompt

Der Workflow verwendet folgenden Prompt für die KI-Zusammenfassung:

> Du bist ein Musikfan, der aber wenig Zeit hat und aus einer Vielzahl von Rezensionen spannend neue Musik entdecken möchte. Lesen den Text und bearbeite folgende Aufgaben:
>
> **Aufgabe**
> 1. Schreibe eine Zusammenfassung von maximal 1000 Zeichen. Der Text soll sich leicht lesen lassen und einen Eindruck vermitteln, ob es sich lohnt das Album zu hören. Die Spache für die Zusammenfassung it deutsch!
> 2. Finde heraus, um welche Musikrichtung es sich handelt.

## Installation

1. Importiere die `musikRadar.json` in deine n8n-Instanz
2. Konfiguriere alle erforderlichen Credentials:
   - OpenAI API Key
   - Apple Music Bearer Token
   - MySQL Datenbankverbindung
   - SMTP E-Mail-Account
3. Erstelle die erforderlichen Datenbanktabellen
4. Aktiviere die Trigger nach Bedarf
5. Teste den Workflow mit dem manuellen Trigger

## Konfiguration

### Anpassbare Parameter
- **Batch-Größe** für API-Anfragen (Standard: 5 Anfragen alle 2 Sekunden)
- **Limit** für die Anzahl der zu verarbeitenden Reviews
- **E-Mail-Template** im "Email Content"-Node
- **Filter-Kriterien** für Ratings und Rezensionsquellen

## Verwendung

### Automatischer Betrieb
Die Workflow-Trigger führen den Prozess automatisch aus:
1. Regelmäßiger Abruf neuer Rezensionen
2. Automatische Verarbeitung und Speicherung
3. Zeitgesteuerter E-Mail-Versand an Empfänger

### Manuelle Ausführung
Klicke auf "When clicking 'Execute workflow'" für einen manuellen Testlauf.

## Fehlerbehandlung

Der Workflow enthält mehrere Sicherheitsmechanismen:
- Prüfung auf Apple Music-Verfügbarkeit
- Filter für fehlende Titel
- Duplikatserkennung über Datenbank
- Fehlerprotokollierung in "Save Link and dont retry"

## Output-Format

E-Mails enthalten:
- **Album-Titel** und **Künstler**
- **Musikrichtung**
- **KI-generierte Zusammenfassung** (deutsch, max. 1000 Zeichen)
- **Apple Music Link** mit Cover-Artwork
- **Original-Rezensionslink**

## Wartung

### Regelmäßige Aufgaben
- Überwachung der API-Limits (OpenAI, Apple Music)
- Datenbank-Bereinigung alter Rezensionen
- Aktualisierung der Empfängerliste
- Prüfung der E-Mail-Zustellbarkeit

## Lizenz und Hinweise

Bitte beachte die Nutzungsbedingungen der verwendeten APIs:
- OpenAI API Terms of Service
- Apple Music API Guidelines
- Copyright der Quellseiten (Laut.de, Resident Advisor, MusikExpress)

## Support

Bei Fragen oder Problemen mit dem Workflow:
1. Prüfe die n8n-Ausführungslogs
2. Verifiziere alle Credentials
3. Teste einzelne Nodes isoliert
4. Überprüfe die Datenbank-Verbindung
