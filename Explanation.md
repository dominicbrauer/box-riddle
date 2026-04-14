
## Keine Strategie

Nehmen wir an, die Gefangenen gehen ohne jegliche Strategie an das Spiel heran. Jeder Gefangene, der in den Raum geht, untersucht zufällig Boxen, bis er die Hälfte der Boxen im Raum geöffnet hat. Die Chance, dass ein Gefangener die Box mit seinem Zettel findet, liegt demnach bei 50%, da er die Hälfte aller Boxen öffnen darf und jede Box die selbe Wahrscheinlichkeit hat, den Zettel beinhalten zu können.

Die Wahrscheinlichkeit eines Gefangenen, seinen Zettel finden zu können, ist stochastisch unabhängig davon, ob die anderen Gefangenen ihren Zettel finden konnten. Die Wahrscheinlichkeit, dass während des gesamten Spiels alle 100 Gefangenen ihren Zettel finden können, ist demnach $\frac{1}{2}^{100}$.

Diese Zahl entspricht $\approx 7,88\times10^{-31}$ oder $0.00000000000000000000000000008\%$

Es ist in etwa gleich wahrscheinlich, den Lotto-Jackpot (1 zu 300 Mio.) **vier Mal hintereinander** zu gewinnen. Die Chance, dass die Gefangenen auf diesem Wege das Spiel gewinnen, liegt in der Realität im Prinzip bei Null.

## Permutationen und Schleifen

Mit der richtigen Strategie kann die Wahrscheinlichkeit, dass alle Gefangenen ihren Zettel finden und das Spiel demnach gewinnen können, über 30% betragen - und das unabhängig von der Anzahl an Gefangenen.
Die Wahrscheinlichkeit, dass zwei Gefangene durch zufälliges Auswählen aus den 100 Boxen ihre Zettel finden können \[$\frac{1}{2}^2 = \frac{1}{4}$ ($25\%$)\] ist demnach sogar geringer als die Wahrscheinlichkeit, dass alle 100 Gefangenen mit der richtigen Strategie ihre Zettel finden können ($>30\%$).

Im ersten Moment scheint diese Annahme unmöglich. Selbst nachdem einigen Menschen diese Lösung des Rätsels erläutert wurde, konnten diese dennoch nicht begreifen, wieso es möglich ist.

Es wird sich das Konzept von Permutationen von Zahlen zunutze gemacht. Im Spiel werden 100 zufällig nummerierte Zettel in 100 sortierte Boxen gelegt. Eine Box hat demnach eine Nummerierung von 1-100 und beinhaltet einen Zettel mit der Zahl 1-100. Nun geht Gefangener Nummer 1 in den Raum und öffnet, wie die Strategie es verlangt, seine Box Nummer 1. Mit diesem Schritt befindet sich der Gefangene **garantiert** auf der Schleife an Zahlen, auf welcher sich der Zettel mit seiner Zahl befindet.
Jede Box führt durch den darin enthaltenen Zettel zu einer weiteren Box. Das geht solange weiter, bis der Zettel einer Box zurück auf jene Box führt, bei welcher angefangen wurde. Das kann man sich wie Domino-Steine vorstellen. Auf jedem Stein steht links die Zahl der Box und rechts die Zahl auf dem Zettel dieser Box. Jetzt verbindet man an diese Zettelzahl immer den Domino-Stein, welcher die Box mit eben dieser Zahl zeigt. Dieser "Loop" wird immer geschlossen sein und kann nicht auf ein totes Ende führen, da sonst ein Zettel auf keine Box zeigen müsste.

![[Pasted image 20250404190240.png]]

Bei der zufälligen Generierung der Zettel entstehen solche Schleifen in verschiedenen Längen. Mal kann eine Box sofort den eigenen Zettel beinhalten, welcher auf die eigene Box zeigt. Ebenso kann die Schleife so lang sein wie es Boxen gibt, also ein geschlossener Loop aus 100 Zahlen.
Da die Gefangenen nur die Hälfte aller Boxen im Raum öffnen dürfen, darf die Schleife, auf welcher sich die Zahl des Gefangenen befindet, nicht länger als die Hälfte aller Boxen (50) sein.

> [!info] Der Trick
> Die Wahrscheinlichkeit, dass alle Gefangenen das Spiel gewinnen, ist demnach die Wahrscheinlichkeit, dass bei einer zufälligen Permutation aus 100 Zahlen keine Schleife entsteht, die länger als 50 ist.

## Mit $n$ vielen Gefangenen

$P(n\ Gefangene\ Gewinnen) = 1 - P(längste\ Schleife\ >\ n/2)$
Bei $n = 100$ kommt man somit auf: $1 - (\frac{1}{51}+\frac{1}{52}+\frac{1}{53}+...+\frac{1}{100}) = 31.18\%$
$n = 1,000 : 1 - (\frac{1}{501}+\frac{1}{502}+\frac{1}{503}+...+\frac{1}{1,000}) = 30.74\%$
$n = 1,000,000 : 1 - (\frac{1}{500,001}+\frac{1}{500,002}+\frac{1}{500,003}+...+\frac{1}{1,000,000}) = 30.68533\%$
$n = 1,000,000,000 : 1 - (\frac{1}{500,000,001}+\frac{1}{500,000,002}+\frac{1}{500,000,003}+...+\frac{1}{1,000,000,000}) = 30.68528\%$

Je größer $n$ wird, desto kleiner sind die Sprünge der Wahrscheinlichkeiten. Nehmen wir an wir nehmen ein unbestimmtes $n$, dann lässt sich folgendes ermitteln:

$P(Gefangene\ scheitern) = \int_{n}^{2n} \frac{1}{x} \, dx$

Das Integral, welches die Fläche unter dem Graphen mit dem Verlauf $\frac{1}{x}$ berechnet, ergibt letztendlich exakt $ln(2)$. Die Gefangenen gewinnen also mit einer $1 - ln(2)$ Wahrscheinlichkeit das Spiel, was etwa $0.30685$ oder $30.7\%$ ergibt. Diesen Wert strebt die Wahrscheinlichkeit unabhängig von der Anzahl an Gefangenen an. Somit gilt die Aussage *"Die Gefangenen haben mit der richtigen Strategie immer eine Gewinnchance von über 30%"* für alle $n$ und ist somit korrekt.
