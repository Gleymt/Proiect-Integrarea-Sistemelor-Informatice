# Proiect-Integrarea-Sistemelor-Informatice

### Introducere

Aceasta este o aplicatie online ce ajuta cu management-ul unei case de schimb valutar.
Pentru crearea paginilor s-a utilizat JSP, CSS, HTML, JS, JSTL.
Pentru conectarea la baza de data s-a MySQL, JDBC.
Pentru generarea de PDF uri s-a folosit PDFMake.

### Utilizare

Utilizatorii vor fi intampinati de o pagina de login. In functie de rolul lor din baza de date, vor fi redirectionati spre aplicatie.

![login](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi1.png?raw=true)

In cazul in care un utilizator si-a uitat parola, exista optiunea de resetare a parolei.

![reset](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi2.png?raw=true)

Dupa logare, se deschide pagina HOME.

![home](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi3.png?raw=true)

Pe pagina Clients, utilizatorul poate vedea toti clientii inscrisi in sistem, de asemenea se poate cauta si filtra tabelul dupa fiecare 
camp al acestuia si se pot exporta datele in format excel sau pdf.

![client](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi4.png?raw=true)

Pe pagina Transactions, utilizatorul poate vedea si altera istoricul tranzactiilor in functie de drepturile acestuia de utilizator.
Totodata avem aceleasi functii de export, filtrare si search.

![trans](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi5.png?raw=true)

Pagina Users este destinata administratorului. Acesta poate creea sau sterge conturi din sistemul casei de schimb valutar.

![users](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi6.png?raw=true)

Pagina Logs este destinata adminstratorului site-ului. Acesta poate verifica actiunile utilizatorilor.

![logs](https://github.com/Gleymt/Proiect-Integrarea-Sistemelor-Informatice/blob/images/images/isi7.png?raw=true)

### Roluri
Admin: detine toate drepturile precum dezvoltatorul aplicatiei.</br>
Angajat: detine drepturi pentru modificarea tranzactiilor si a clientilor.</br>
Client: detine drepturi doar pentru vizualizarea tabelei tranzactii.

