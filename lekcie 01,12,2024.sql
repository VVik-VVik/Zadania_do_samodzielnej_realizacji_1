-- Pytanie nr 15
select * from pytania where id =15;
-- Pytania, w których poprawną odpowiedzią jest "a"
select * from pytania where answer ='a';
-- Pytania z roku 2007
select * from pytania where rok = 2007;
-- Pytania z programowania z roku 2009
select * from pytania where kategoria = 'programowanie' and rok = 2009;
-- Tylko treści pytań i 4 odpowiedzi z roku 2010
select tresc, odpa, odpb, odpc, odpd from pytania where rok = 2010;
-- Pytania ułożone alfabetycznie wg treści
select * from pytania order by tresc asc;
-- Treści pytań o numerach 10-12
select * from pytania where id between 10 and 12;
-- Pytania zaczynające się od słów “Jak”
select * from pytania where tresc like 'Jak%';
-- Pytania zawierające frazę "C++"
select * from pytania where tresc like '%C++%';
-- Pytania z programowania oraz systemów operacyjnych i sieci z roku 2012
select * from pytania where kategoria = 'programowanie' or kategoria = 'systemy operacyjne i sieci' and rok > 2012;
