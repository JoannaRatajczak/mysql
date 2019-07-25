CREATE TABLE pracownik (id INT auto_increment PRIMARY KEY, 
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
wyplata DECIMAL(7,2),
data_urodzenia DATE NOT NULL,
wiek INT NOT NULL,
stanowisko VARCHAR(50)
); 
INSERT INTO pracownik (imie, nazwisko, wyplata, data_urodzenia, wiek, stanowisko) VALUES 
('Geralt', 'Wiedzmin', 10500, "1980-12-24", 39, 'DevOps'), 
('Jeffrey', 'Star', 7000, "1985-01-02", 34, 'kierownik dzialu HR'), 
('Freedie', 'Mercury', 8599, "1946-09-05", 73, 'Architekt'), 
('Joe', 'Cooker', 4500, "1976-11-03", 43,'Java Developer'), 
('Johny', 'Bravo', 2500, "1990-04-24", 29, 'Junior DevOps'), 
('Elon', 'Musk', 18000, "1987-01-16", 32, 'PM'); 
SELECT * FROM pracownik ORDER BY nazwisko;
SELECT * FROM pracownik WHERE stanowisko='DevOps';
SELECT * FROM pracownik WHERE wiek>=30;
UPDATE pracownik SET wyplata=wyplata*1.1 WHERE stanowisko='DevOps';
DELETE FROM pracownik where wiek=(SELECT min(wiek));
DROP TABLE pracownik;
CREATE TABLE stanowisko (id_stanowisko INT auto_increment PRIMARY KEY, 
nazwa VARCHAR(50) NOT NULL,
opis VARCHAR(250),
wyplata DECIMAL(7,2));
CREATE TABLE adres (id_adres INT auto_increment PRIMARY KEY, 
nr_domu VARCHAR(20),
kod_pocztowy INT,
miejscowosc VARCHAR(50));
CREATE TABLE pracownik (id_pracownik INT auto_increment PRIMARY KEY, 
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
id_adres INT NOT NULL,
id_stanowisko INT NOT NULL);
INSERT INTO adres ( nr_domu, kod_pocztowy, miejscowosc) VALUES ('2/9', 666666, 'Londyn'), 
('5a', 888888, 'Wroclaw'),
('3a', 888888, 'Wroclaw'),
('4', 888888, 'Wroclaw');
INSERT INTO stanowisko ( nazwa, opis, wyplata) VALUES ('programista', 'programista C++', 3000),
('programista senior', 'programista .NET', 10000),
('stazysta', 'do przyuczenia zawodu', 1500);
INSERT INTO pracownik (imie, nazwisko, id_adres, id_stanowisko) VALUES ('Pawel', 'Pawel', 2, 3),
('Ciri', 'Ciri', 3, 3),
('Ciri', 'Bajgiel', 1, 3),
('Beagle', 'Doggo', 4, 1),
('Geralt', 'Wiedzmin', 2, 2);
SELECT * FROM pracownik p JOIN adres a ON p.id_pracownik=a.id_adres JOIN stanowisko s ON p.id_pracownik=s.id_stanowisko;
SELECT SUM(wyplata) FROM pracownik p JOIN adres a ON p.id_pracownik=a.id_adres JOIN stanowisko s ON p.id_pracownik=s.id_stanowisko;
SELECT * FROM pracownik p JOIN adres a ON p.id_pracownik=a.id_adres JOIN stanowisko s ON p.id_pracownik=s.id_stanowisko WHERE kod_pocztowy=888888;



