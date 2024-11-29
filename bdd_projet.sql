CREATE TABLE utilisateur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    adresse VARCHAR(255)
);

CREATE TABLE tables (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    places INT
);

CREATE TABLE reservation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    table_id INT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (table_id) REFERENCES tables(id)
);

CREATE TABLE plat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prix DECIMAL(10, 2)
);

CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plat_id INT,
    restaurant_id INT,
    FOREIGN KEY (plat_id) REFERENCES plat(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE avis (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    restaurant_id INT,
    commentaire TEXT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE favoris (
    utilisateur_id INT,
    plat_id INT,
    PRIMARY KEY (utilisateur_id, plat_id),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (plat_id) REFERENCES plat(id)
);

/* ------------------------------------------------------------------------------ */
/*                     INSERTION DE DONNES EXEMPLE                                */

INSERT INTO utilisateur (nom, prenom, email, password) VALUES 
('Dupont', 'Jean', 'jean.dupont@email.com', 'password123'),
('Martin', 'Claire', 'claire.martin@email.com', 'securepassword'),
('Leclerc', 'Paul', 'paul.leclerc@email.com', 'mypassword'),
('Bonaparte', 'Napoléon', 'grand.empereur@gmail.com', 'jesuislemeilleur123');

INSERT INTO restaurant (nom, adresse) VALUES 
('Le Gourmet', '10 Rue de Paris, Paris'),
('Chez Pierre', '15 Rue de Lyon, Lyon');

INSERT INTO tables (numero, places) VALUES 
(1, 4),
(2, 2),
(3, 6);

INSERT INTO plat (nom, prix) VALUES 
('Pâtes Carbonara', 12.50),
('Pizza Margherita', 10.00),
('Salade César', 8.00),
('Salade Grecque', 9.00);

INSERT INTO menu (plat_id, restaurant_id) VALUES 
(1, 1),
(2, 1),
(3, 2);

INSERT INTO avis (utilisateur_id, restaurant_id, commentaire) VALUES 
(1, 1, 'Super restaurant, ambiance agréable !'),
(2, 1, 'Les plats sont délicieux, je recommande.'),
(3, 2, 'Service un peu lent mais plats de qualité.');

INSERT INTO reservation (utilisateur_id, table_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 2);

INSERT INTO favoris (utilisateur_id, plat_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

/* ------------------------------------------------------------------------------ */


