# iOS app 'Geven en Krijgen'

### Projectvoorstel Max Westerman

#### Inleiding
Enkele jaren geleden is de WhatsApp-groep 'Randwijck GEVEN & KRIJGEN' in het leven geroepen door 
enkele actieve buurtbewoners van de Amstelveense wijk Randwijck. Het doel van deze WhatsApp-groep was (en is) 
om laagdrempelig goederen een tweede leven te bieden door ze gratis door te geven aan buurtbewoners.
Met 256 actieve deelnemers en tientalle gedeelde goederen per dag is het initiatief niet alleen erg handig en duurzaam, maar ook ontzettend leuk!

De volgende [afbeelding](/doc/Foto1-whatsapp.jpeg) toont hoe een bureaustoel, een (super mooie) fiets en een speelgoed werkbank in de groep werden aangeboden.

#### Beperkingen
Het initiatief loopt ook tegen enkele belemmeringen op, die in de gesprekken duidelijk naar voren komen. 
Zo kent de groep door de restricties van WhatsApp, het platform wat momenteel wordt gebruikt voor het aanbieden en opvragen van goederen, 
een maximaal aantal deelnemers van 256 personen. De lijst van buurtbewoners die actief mee zouden willen doen met dit initiatief is echter veel groter (400+).
Al enkele tijd worden er pogingen gedaan tot betere alternatieven, zoals het gebruik van Telegram (zie [afbeelding](/doc/Foto3-whatsapp.jpeg) en [afbeelding](/doc/Foto4-whatsapp.jpeg). Toch heeft een dergerlijke transitie wegens de vertrouwlijkheid em het gebruikersgemak van het huidige platform nog niet plaatsgevonden.
Ook wordt de functionaliteit van de huidige manier van communiceren via WhatsApp ingekaderd door de vormgeving en functionaliteit van het communicatieplatform WhatsApp. Ook hier zijn enkele opmerkingen over gemaakt die stellen dat andere platformen wellicht meer zouden passen bij het type activiteit van het initiatief (zie [afbeelding](/doc/Foto2-whatsapp.jpeg)).

#### Oplossing: de app 'Geven en Krijgen'
De app 'Geven en Krijgen' heeft tot doel een bestaande maatschappelijke activiteit efficienter, gebruikersvriendelijker, (potentieel) grootschaligheid en leuker te maken door drie aspecten te introduceren:
- Verruiming deelnemerlijst
- Verbetering visualistatie en functionaliteit (taakgericht)
- Toevoegen spelelement

#### Verruiming deelnemerlijst
Het belangrijkste probleem waar de bewoners momenteel tegenaanlopen is dat er meer vraag is naar deelname van de groepsapp dan dat er plek is.
Dit probleem zal in de app 'Geven en Krijgen' opgelost worden. Het platform CloudKit van Apple voorziet in de database die nodig is 
om grote hoeveelheden data (1PB of storage) te bewaren. Door dit middel is het mogelijk om data van veel meer dan 256 personen te gebruiken.
Alle 400+ bewoners van Randwijck zouden, mits zij gebruik maken van een Apple device (en een Apple ID hebben), gedeelde advertenties kunnen zien en nieuwe plaatsen. 
Door de 1PB datastorage is het zelfs mogelijk de app op den duur uit te breiden naar andere buurten.

#### Verbetering visualistatie en functionaliteit
Het aanbieden en opvragen van goederen door buurtbewoners gebeurt momenteel door middel van WhatsApp, een communicatiemiddel dat niet expliciet 
ontworpen is voor dit type activiteit. Een vormgeving en/of functionaliteit zoals bijvoorbeeld Marktplaats en Vinted, waar gebruikers producten aanbieden (toevoegen) en verkopen (waarna de advertentie wordt verwijderd) zou wellicht een betere aansluiting vinden bij het initiatief van de buurtbewoners.
De app 'Geven en Krijgen' speelt hierop in. Door een duidelijke vormgeving, simpele functionaliteit en een spelelement (waarover later meer) voorziet de app in precies wat de buurtbewoners nodig hebben. Hieronder enkele foto's.

<p float="left">
<img src="https://github.com/minprog-platforms/project-maxwesterman/blob/main/doc/AfbeeldingApp1.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="200" height="450" />

<img src="https://github.com/minprog-platforms/project-maxwesterman/blob/main/doc/AfbeeldingApp2.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="200" height="450" />

<img src="https://github.com/minprog-platforms/project-maxwesterman/blob/main/doc/AfbeeldingApp3.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="200" height="450" />
</p>

#### Toevoegen spel-element
Momenteel wordt grotendeels de 'first come, first served' basis gebruikt, waarbij een buurtbewoner een goed aanbied, en de eerste die reageert kan hem ophalen. Om meer activiteit te stimuleren en het concept leuker te maken kan er nog een andere manier van verdeling van de goederen worden bedacht, namelijk: wie de meeste punten (wat in deze app 'zonnetjes' wordt genoemd) heeft opgebouwd maakt de meeste kans. Deze punten kunnen verzameld worden door goederen aan te bieden. Een klein goed is 1 punt, een gemiddeld goed 2 en een duur goed 3. Bij het opvragen van een goed kan er worden gefilterd op de persoon die de meeste punten heeft (en dus in het verleden de meeste goederen heeft aanboden), maar ook op degene die als eerste heeft gereageerd. Dit stimuleert het aanbieden van goederen en stimuleert het gebruik van het initiatief.

#### Vereisten
Zoals beschreven maakt de app gebruik van CloudKit. Dit heeft als nadeel dat gebruikers over een Apple ID moeten beschikken.
Daarnaast moeten gebruikers toestemming geven voor het delen van foto's en enkele persoonlijke gegevens.

#### Nadelen 
Niet alle hierboven geschreven functies werken optimaal. Het is mogelijk om als gebruiker in te loggen, vervolgens enkele foto's (max. 10) gecombineerd met een korte en lange beschrijving te plaatsen, en deze terug te zien in de lijst met goederen in het tabblad 'Geven Krijgen'. Helaas is er wegens tijdgebrek nog geen vervolgsscherm op de verschillende advertenties waar gebruikers op kunnen reageren. Ook is de informatie op de profiel view (profielfoto, naam, buurt en zonnetjes) nog niet gekoppeld aan een persoonlijk ID. Het is nu nog gehardcode. Wel geeft het een goed beeld van de uiteindelijke vormgeving. Ook het tabblad instellingen is niet uitgewerkt wegens tijdgebrek.

[Link naar video](https://youtu.be/tkyx4iIcBQo)

