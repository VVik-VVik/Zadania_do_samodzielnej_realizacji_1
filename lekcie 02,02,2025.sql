-- 1. Wstawiające do tabeli reserwacje record z danymi: numer stolika = 1, data = "2017-07-04", liczba osób = 4, numer telefonu = "111222333", wartość pola id nadawana jest automatyczne
INSERT INTO rezerwacje VALUES (NULL,'2017-07-04', 4, '111222333');
-- 2. Wybierające z tabeli daania jedynie pola nazwa i cena dla dań mięsnych (Typ 1-zupy, 2-mięsne, 3-przekąski, 4-napoje)
SELECT nazwa, cena FROM dania WHERE typ =2;
-- 3. Wybierające z tabeli daania jedynie pola nazwa dla takich przekąsek, których cena jest mniejsza od 15 zł
SELECT nazwa FROM dania WHERE typ =3 AND CENA < 15;
-- 4. Aktualizujące dane w tabeli pracownicy. Dla wszystkich pracowników, którzy zatrudnieni są jako kelner, należy dokonać zmiany stanowiska na barman (pole stanowisko 1-kucharz, 2-pomoc, 3-kelner, 4-barman)
UPDATE pracownicy SET stanowisko =4 WHERE stanowisko =3;

-- 1.
SELECT * FROM `ryby` WHERE styl_zycia=1;
-- 2.
SELECT Ryby_id, wymiar_ochronny FROM `okres_ochronny` WHERE wymiar_ochronny<30;
-- 3.
SELECT ryby.nazwa, lowisko.akwen, lowisko.wojewodztwo FROM ryby JOIN lowisko ON ryby.id=lowisko.Ryby_id WHERE lowisko.rodzaj=3;
-- 4.
ALTER TABLE ryby ADD COLUMN dobowy_limit TINYINT UNSIGNED;

-- 1. 
SELECT marka, rocznik, kolor FROM samochody WHERE kolor='niebieski';
-- 2.
SELECT COUNT(*) FROM samochody WHERE marka IN('Toyota', 'Opel') AND stan='bardzo dobry';
-- 3.
UPDATE samochody SET stan='dobry' WHERE rocznik<2004;
-- 4.
CREATE USER 'jan'@'localhost' IDENTIFIED BY 'janKowalski1@';
-- 5.
GRANT SELECT, INSERT, UPDATE ON samochody.* TO 'jan@localhost';

-- 1. 
INSERT INTO zawody_wedkarskie (Karty_wedkarskie_id, Lowisko_id, data_zawodow, sedzia)
VALUES ('2', '4', '2021-09-28', 'Andrzej Nowak');
-- poprawnie
INSERT INTO zawody_wedkarskie VALUES (NULL, 2, 3, '2021-06-28', 'Azej Noak');
-- 2.
SELECT id, data_zawodow FROM zawody_wedkarskie WHERE sedzia='Krzysztof Dobrowolski';
-- 3.
SELECT karty_wedkarskie.imie, karty_wedkarskie.nazwisko, karty_wedkarskie.punkty FROM karty_wedkarskie JOIN zawody_wedkarskie ON karty_wedkarskie.id=zawody_wedkarskie.id
WHERE zawody_wedkarskie.id=4;
-- 4.
UPDATE karty_wedkarskie SET punkty = punkty + 2 WHERE id = 1;
