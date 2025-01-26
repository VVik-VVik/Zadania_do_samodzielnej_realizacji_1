-- 1. Wyświetl wszystkich użytkowników wraz z ich zamówieniami.

-- poprawnie
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Zamowienia.data_Zamowienia, Zamowienia.ilosc
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id;
-- 2. Wyświetl wszystkie zamówienia zawierające produkty.
SELECT Produkty.nazwa, Zamowienia.produkt_id
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id;
-- poprawnie

-- 3. Wyświetl imię i nazwisko klientów, którzy zamówili produkty z kategorii 'Elektronika'.
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Produkty.kategoria
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
JOIN Produkty ON Produkty.id=Zamowienia.produkt_id
WHERE Produkty.kategoria LIKE 'Elektronika';
-- poprawnie

-- 4. Uzyskaj nazwę produktu, datę zamowienia oraz ilość.
SELECT Produkty.nazwa, Zamowienia.data_zamowienia, Zamowienia.ilosc
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id;
-- poprawnie

-- 5. Wyświetl pełną listę zamówień, uwzględniając tylko tych użytkowników, którzy dokonali zamówienia.
SELECT Zamowienia.data_zamowienia, Zamowienia.ilosc, Uzytkownicy.imie, Uzytkownicy.nazwisko
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id;
-- poprawnie

-- 6. Wyświetl zamówione produkty oraz ich cenę.
SELECT Produkty.nazwa, Produkty.cena
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id;
-- poprawnie

-- 7. Wyświetl imię, nazwisko oraz produkty, które zostały zamówione.
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Produkty.nazwa
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
JOIN Produkty ON Produkty.id=Zamowienia.produkt_id;
-- poprawnie

-- 8. Połącz tabelę Zamowienia i Uzytkownicy, aby wyświetlić użytkowników oraz daty ich zamówień.
SELECT Zamowienia.data_zamowienia, Uzytkownicy.imie, Uzytkownicy.nazwisko
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id;
-- poprawnie

-- 9. Wyświetl użytkowników oraz produkty, które zamówili, posortowane po dacie zamówienia.
SELECT Zamowienia.data_zamowienia, Uzytkownicy.imie, Uzytkownicy.nazwisko, Produkty.nazwa
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
JOIN Produkty ON Produkty.id=Zamowienia.produkt_id 
ORDER BY Zamowienia.data_zamowienia ASC;
-- poprawnie

-- 10. Połącz tabelę Produkty i Zamowienia, aby uzyskać listę produktów zamówionych w dniu 1 stycznia 2025.
SELECT Zamowienia.data_zamowienia, Zamowienia.ilosc, Produkty.nazwa, Produkty.cena, Produkty.kategoria
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id
WHERE Zamowienia.data_zamowienia = '2025-01-01';
-- poprawnie

-- 11. Połącz tabelę Uzytkownicy i Produkty, aby wyświetlić imiona i nazwiska użytkowników oraz produkty, które zamówili w kategorii 'Meble'.
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Produkty.nazwa
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
JOIN Produkty ON Produkty.id=Zamowienia.produkt_id
WHERE Produkty.kategoria LIKE 'Meble';
-- poprawnie

-- 12. Połącz tabelę Produkty i Zamowienia, aby uzyskać produkty, które zostały zamówione więcej niż 3 razy.

-- poprawnie
SELECT Produkty.nazwa, SUM(Zamowienia.ilosc) AS total_ilosc
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id
GROUP BY  Produkty.nazwa
HAVING total_ilosc > 3;

-- Wyświetl nazwę produktu, datę zamówienia, ilość zamówień.
SELECT Produkty.nazwa, Zamowienia.data_zamowienia, Zamowienia.ilosc
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id;
-- poprawnie

-- 13. Wyświetl imię, nazwisko użytkowników, którzy złożyli zamówienie w 2025 roku.
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Zamowienia.data_zamowienia
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
WHERE Zamowienia.data_zamowienia LIKE '2025%';
-- poprawnie

-- 14. Wyświetl nazwę produktu, datę zamówienia oraz ilość dla produktów z kategorii 'Dom'.
SELECT Produkty.kategoria, Produkty.nazwa, Zamowienia.data_zamowienia, Zamowienia.ilosc
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id
WHERE Produkty.kategoria LIKE 'Dom';
-- poprawnie

-- 15.Wyświetl imię, nazwisko oraz nazwy produktów dla użytkowników, którzy mają więcej niż 30 lat.
SELECT Uzytkownicy.imie, Uzytkownicy.nazwisko, Uzytkownicy.wiek, Produkty.nazwa
FROM Uzytkownicy
JOIN Zamowienia ON Uzytkownicy.id=Zamowienia.uzytkownik_id
JOIN Produkty ON Produkty.id=Zamowienia.produkt_id
WHERE Uzytkownicy.wiek > 30;
-- poprawnie

-- 16. Wyświetl nazwy produktów i ilość, których cena jest wyższa niż 1000 zł
SELECT Produkty.nazwa, Produkty.cena, Zamowienia.ilosc
FROM Produkty
JOIN Zamowienia ON Produkty.id=Zamowienia.produkt_id
WHERE Produkty.cena > 1000;
-- poprawnie

