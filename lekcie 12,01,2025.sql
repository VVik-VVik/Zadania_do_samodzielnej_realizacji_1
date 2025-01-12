-- Wyświetl tytul książek i ich statusy zamówien
SELECT ksiazki.tytul, zamowienia.status
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki;

SELECT k.tytul, z.status
FROM ksiazki k  
JOIN zamowienia z ON k.idksiazki=z.idksiazki;

-- Wyświetl imiona, nazwiska klientów i date zamówien
SELECT klienci.imie, klienci.nazwisko, zamowienia.data
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta;

-- Wyświetl id zamówienia które nie mają przypisanej żadnej książki
SELECT zamowienia.idzamowienia, ksiazki.tytul
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki = zamowienia.idksiazki
WHERE ksiazki.idksiazki IS NULL;

-- Wyświetl  tytul ksiązki, imiona, nazwiska klientów i date zamówien
SELECT ksiazki.tytul, klienci.imie, klienci.nazwisko, zamowienia.data
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
JOIN klienci ON klienci.idklienta=zamowienia.idklienta;

-- nie dziala? jest kolejka
SELECT ksiazki.tytul, klienci.imie, klienci.nazwisko, zamowienia.data
FROM ksiazki
JOIN klienci ON klienci.idklienta=zamowienia.idklienta
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki;

-- Wyświetl imiona, nazwiska klientów, liczbe zamówionych książek i pogrupuj je po imieniu i nazvisku
SELECT klienci.imie, klienci.nazwisko, COUNT(*)  
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY imie, nazwisko;
-- licba zamówień
SELECT klienci.imie, klienci.nazwisko, COUNT(zamowienia.idzamowienia)
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY imie, nazwisko;
-- zaznacza zamiast COUNT liczba 
SELECT klienci.imie, klienci.nazwisko, COUNT(zamowienia.idzamowienia) AS liczba 
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY imie, nazwisko;
-- poprawnie
SELECT klienci.imie, klienci.nazwisko, COUNT(zamowienia.idzamowienia) AS liczba_zamowien 
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY klienci.imie, klienci.nazwisko;


-- 1. Wyświetl tytuły książek, które były zamawiane więcej niż jeden raz.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien 
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
HAVING COUNT(zamowienia.idzamowienia) > 1;
-- 2. Wyświetl wszystkich klientów, którzy nie dokonali żadnych zamówień.
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta = zamowienia.idklienta
WHERE zamowienia.idzamowienia IS NULL;
-- 3. Pokaż klientów, którzy zamówili książki o cenie powyżej 50 zł.
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
JOIN ksiazki ON zamowienia.idksiazki=ksiazki.idksiazki
WHERE ksiazki.cena > 50;
-- 4. Wyświetl książki i liczbę zamówień, posortowane malejąco.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki 
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
ORDER BY liczba_zamowien desc;
-- 5. Pokaż książki zamówione przez więcej niż jednego klienta.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
HAVING COUNT(zamowienia.idzamowienia) > 1
ORDER BY liczba_zamowien desc;
-- poprawnie

-- 6. Pokaż klientów, którzy zamówili książki droższe niż 100 zł.
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
JOIN ksiazki ON zamowienia.idksiazki=ksiazki.idksiazki
WHERE ksiazki.cena > 100;
-- poprawnie

-- 7. Znajdź najczęściej zamawianą książkę.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY zamowienia.idzamowienia
HAVING COUNT(zamowienia.idzamowienia) > 1
ORDER BY liczba_zamowien desc;
-- poprawnie
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
ORDER BY liczba_zamowien desc
LIMIT 1;
-- 8. Pokaż klienta z największą liczbą zamówień.
SELECT klienci.imie, klienci.nazwisko 
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY klienci.imie, klienci.nazwisko 
HAVING COUNT(zamowienia.idzamowienia) > 1;
-- popprawnie
SELECT klienci.imie, klienci.nazwisko, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
GROUP BY klienci.imie, klienci.nazwisko 
ORDER BY liczba_zamowien desc
LIMIT 1;
-- 9. Pokaż wszystkie zamówienia posortowane według daty.
SELECT zamowienia.idzamowienia, zamowienia.data
FROM zamowienia
ORDER BY zamowienia.data asc;
-- popprawnie

-- 10. Pokaż klientów, którzy nie zamówili żadnej książki po 2020 roku.
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
JOIN ksiazki ON zamowienia.idksiazki=ksiazki.idksiazki
WHERE zamowienia.data > '2020-01-01';
-- popprawnie
SELECT klienci.imie, klienci.nazwisko
FROM klienci
LEFT JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
WHERE zamowienia.data > '2020-01-01';

-- 1. Wybierz książki, które zostały zamówione dokładnie raz.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
HAVING COUNT(zamowienia.idzamowienia) = 1;
-- popprawnie

-- 2. Pokaż klientów, którzy zamówili książki w marcu.
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
WHERE zamowienia.data BETWEEN '2014-03-01' and '2014-03-31';
-- popprawnie
SELECT klienci.imie, klienci.nazwisko
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
WHERE Month(zamowienia.data) =3;
-- 3. Pokaż książki zamówione przez klientów z Warszawy.
SELECT ksiazki.tytul
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
JOIN klienci ON klienci.idklienta = zamowienia.idklienta
WHERE klienci.miejscowosc LIKE 'Warszawa';
-- popprawnie

-- 4. Pokaż liczbę zamówień dla każdej książki.
SELECT ksiazki.tytul, COUNT(zamowienia.idzamowienia) AS liczba_zamowien
FROM ksiazki
JOIN zamowienia ON ksiazki.idksiazki=zamowienia.idksiazki
GROUP BY ksiazki.tytul
HAVING COUNT(zamowienia.idzamowienia) > 0;
-- popprawnie

-- 5. Pokaż klientów i sumę wartości ich zamówień.
SELECT klienci.imie, klienci.nazwisko, ksiazki.cena
FROM klienci
JOIN zamowienia ON klienci.idklienta=zamowienia.idklienta
JOIN ksiazki ON ksiazki.idksiazki=zamowienia.idksiazki;
-- popprawnie
