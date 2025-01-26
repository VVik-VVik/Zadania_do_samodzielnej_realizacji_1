-- 1. Wyświetl wszystkie dane użytkowników.
SELECT * FROM Users;
-- popprawnie

-- 2. Wyświetl tylko imiona i nazwiska użytkowników.
SELECT FirstName, LastName FROM Users;
-- popprawnie

-- 3. Wyświetl użytkowników, którzy mają więcej niż 30 lat.
SELECT FirstName, LastName, Age FROM Users WHERE Age > 30;
-- popprawnie

-- 4. Wyświetl użytkowników, których imię zaczyna się na "J".
SELECT FirstName FROM Users WHERE FirstName LIKE 'J%';
-- popprawnie

-- 5. Wyświetl użytkowników, których nazwisko kończy się na "son".
SELECT LastName FROM Users WHERE LastName LIKE '%son';
-- popprawnie

-- 6. Znajdź użytkowników w wieku 28 lat.
SELECT FirstName, LastName, Age FROM Users WHERE Age = 28;
-- popprawnie

-- 7. Znajdź użytkowników w wieku pomiędzy 25 a 35 lat.
SELECT FirstName, LastName, Age FROM Users WHERE Age BETWEEN 25 AND 35;
-- popprawnie

-- 8. Wyświetl użytkowników, którzy mają mniej niż 25 lat lub więcej niż 35 lat.

-- popprawnie

-- 9. Wyświetl użytkowników, którzy mają dokładnie 22 lub 27 lat.
SELECT FirstName, LastName, Age FROM Users WHERE AGE = 22 OR Age = 27;
-- popprawnie

-- 10. Posortuj użytkowników według wieku rosnąco.
SELECT FirstName, LastName, Age FROM Users ORDER BY Age ASC;
-- popprawnie

-- 11. Posortuj użytkowników według wieku malejąco.
SELECT FirstName, LastName, Age FROM Users ORDER BY Age DESC;
-- popprawnie

-- 12. Posortuj użytkowników według nazwiska, a następnie według imienia.

-- popprawnie

-- 13. Policz wszystkich użytkowników w tabeli.
SELECT COUNT(*) FROM Users;
-- popprawnie

-- 14. Policz, ilu użytkowników ma więcej niż 30 lat.
SELECT COUNT(*) FROM Users WHERE Age > 30;
-- popprawnie

-- 15. Znajdź średni wiek użytkowników.
SELECT AVG(Age) AS sredni_wiek FROM Users;
-- popprawnie

-- 16. Znajdź maksymalny wiek użytkownika.
SELECT MAX(Age) AS MAX_wiek FROM Users;
-- popprawnie

-- 17. Znajdź sumę wszystkich wieków użytkowników.
SELECT SUM(Age) AS SUM_wiek FROM Users;
-- popprawnie

-- 18. Znajdź liczbę użytkowników w każdej grupie wiekowej większej niż 30 lat.

-- popprawnie

-- 19. Pogrupuj użytkowników według nazwiska i znajdź, ilu użytkowników ma takie samo nazwisko.
SELECT LastName, COUNT(*) AS liczba FROM Users GROUP BY LastName HAVING COUNT(*) > 1;
-- popprawnie
