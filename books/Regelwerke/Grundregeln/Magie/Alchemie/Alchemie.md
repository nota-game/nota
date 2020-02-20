
# Alchemie

| Information
|-------------------------------------------------------------------------------
| Die Alchemie ist ein relative Komplexe Art der Magie (Regeltechnisch).
| zumindest wenn man sich nicht nur auf fertige Rezepte beschränkt, sondern die
| Mechanik zur Entdeckung neuer Zaubermittel und Analyse verwenden möchte.
| Daher wird sie wohl einem großen Teil der Spieler wenig Interesse Wecken.


Die Alchemie ist eine Wissenschaft die sich darauf versteht die Magie der
unterschiedlichen Stoffe der Natur so miteinander zu vermischen um einen
gewünschten Effekt zu erzielen.

Um ein Alchemistisches Erzeugnis zu erstellen, kann ein Rezept verwendet werden.
Diese gibt an welche Zutaten und Ausrüstung benötigt wird. Zudem welche Zeit
veranschlagt wird und sonstige besondere Bedingungen die erfüllt sein müssen.
Der Alchemist legt darauf hin eine Probe ab, die eventuell je nach Rezept
erschwert ist. Das Rezept gibt an welchen Effekt das Produkt bei welchem
Ergebnis hat.

Neben bekannten Rezepten kann ein Alchemist auch Experimentieren und
Verschiedene Zutaten auf verschiedene weisen zusammen mischen und sehen was
passiert. Je nach Wissensstand, kann er auch im vornherein abschätzen was
passieren könnte.

Spieltechnisch ist dies eher mit einem Mathematischen Puzzle gleich zu setzen. Jede Zutat besitzt folgende Informationen:

* Primäraffekt  
  Die Haupteigenschaft wofür die Kräuter meist eingesetzt werden.
  Bei Heilkräutern wären dies z.B. Heilende Effekte.
* Nebenwirkungen  
  Effekte die meist nicht erwünscht bei der Verwendung sind. Es kann durchaus
  sein das eine Regeltechnische Nebenwirkung im Spiel der eigentlich gewünschte
  Effekt ist.
* Ordnungszahl  
  Die Ordnungszahl gibt an welche Effekte sich bei der Bereitung des Trankes
  durchsetzen.
* Eigenschaften  
  Dies können z.B. Mineral, Pflanze etc... sein. Bestimmte Eigenschaften werden
  benötigt um gewisse Verarbeitungsmethoden zu verwenden. So kann eine
  Flüssigkeit z.B. nicht gemahlen werden.
* Alchemieschlüssel  
  Dies sind 3 Gruppen a vier Hexadezimalziffern. Sie werden verwendet um
  herauszufinden welche Eigenschaften ein alchemistisches Produkt hat.

Ein Alchemistiches Produkt besteht immer aus mindestens 3 Zutaten. In der
Standard Zubereitung werden diese zerkleinert und miteinander vermischt. Will
man nun herausfinden welche effekte das Produkt hat schreibt man die
Alchemieschlüssel in eine Tabelle. Dabei werden die Zutaten nach ihrer
Ordnungszahl sortiert. Die erste Spalte enthält die ersten Gruppen der Zutarten
Sortiert nach Ordnungszahl. Die Zweite Spalte beinhaltet die zweite Gruppe,
beginnt jedoch mit der letzten Zutat und an zweiter stelle kommen die restlichen
zutaten wieder nach Ordnungszahl sortiert. Die dritte Spalte enthält die dritte
Gruppe und beginnt mit der vorletzten Zutat gefolgt von der Letzten. Erst
hiernach kommen die Restlichen Zutaten sortiert nach ihrer Ordnungszahl.

Die nun folgenden Berechnungen benötigen das Verständnis von Binärzahlen.

Für jede Spalte werden die Zahlen der Spalte miteinander XOR kombiniert und die
1-en in Binärdarstellung gezählt. Bei den Primäreffekten sind angegeben mit
welcher Anzahl von 1-en welcher Effekt eintritt. Die Erste Spalte bestimmt den
Effekt der ersten Zutat (nach Ordnungszahl), die zweite Spalte die zweite Zutat
und die letzte Spalte die dritte Zutat. Die Primäraffekte eventuell weitere
Zutaten haben keinen Effekt.

Die selbe Methode wird je spalte verwendet. Nur bestimmt dies die Nebeneffekte
des Produktes. Jede Zutat kann Nebeneffekte hinzufügen. Es gibt hierbei keine
Beschränkung auf die ersten drei Zutaten. Dabei darf jedoch keine Reihe weniger
Nullen haben (XOR) als die Anzahl der Zutaten beträgt. Andernfalls ist das
Produkt fehlgeschlagen, und hat keine Auswirkung.

Sollte ein Produkt keinen Primäreffekt haben, sondern nur Nebeneffekte, ist es
ebenfalls fehlgeschlagen und hat keinen Effekt.


# XOR Tabelle

|   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 0 | 3 | 2 | 5 | 4 | 7 | 6 | 9 | 8 | B | A | D | C | F | E |
| 2 | 3 | 0 | 1 | 6 | 7 | 4 | 5 | A | B | 8 | 9 | E | F | C | D |
| 3 | 2 | 1 | 0 | 7 | 6 | 5 | 4 | B | A | 9 | 8 | F | E | D | C |
| 4 | 5 | 6 | 7 | 0 | 1 | 2 | 3 | C | D | E | F | 8 | 9 | A | B |
| 5 | 4 | 7 | 6 | 1 | 0 | 3 | 2 | D | C | F | E | 9 | 8 | B | A |
| 6 | 7 | 4 | 5 | 2 | 3 | 0 | 1 | E | F | C | D | A | B | 8 | 9 |
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 | F | E | D | C | B | A | 9 | 8 |
| 8 | 9 | A | B | C | D | E | F | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| 9 | 8 | B | A | D | C | F | E | 1 | 0 | 3 | 2 | 5 | 4 | 7 | 6 |
| A | B | 8 | 9 | E | F | C | D | 2 | 3 | 0 | 1 | 6 | 7 | 4 | 5 |
| B | A | 9 | 8 | F | E | D | C | 3 | 2 | 1 | 0 | 7 | 6 | 5 | 4 |
| C | D | E | F | 8 | 9 | A | B | 4 | 5 | 6 | 7 | 0 | 1 | 2 | 3 |
| D | C | F | E | 9 | 8 | B | A | 5 | 4 | 7 | 6 | 1 | 0 | 3 | 2 |
| E | F | C | D | A | B | 8 | 9 | 6 | 7 | 4 | 5 | 2 | 3 | 0 | 1 |
| F | E | D | C | B | A | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |


| Zahl | Wert |
|------|------|
| 1    | 1    |
| 2    | 1    |
| 3    | 2    |
| 4    | 1    |
| 5    | 2    |
| 6    | 2    |
| 7    | 3    |
| 8    | 1    |
| 9    | 2    |
| A    | 2    |
| B    | 3    |
| C    | 2    |
| D    | 3    |
| E    | 3    |
| F    | 4    |































