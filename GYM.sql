
CREATE TABLE `activite` (
  `id_activite` int(11) NOT NULL,
  `NOM_ACTIVITE` varchar(50) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `CAPACITE` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `disponibile` tinyint(1) DEFAULT NULL
) 

CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL
) 


CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `idmembre` int(11) NOT NULL,
  `idactivite` int(11) NOT NULL,
  `date_reservation` datetime DEFAULT current_timestamp(),
  `statut` enum('Confirmee','Annulee') DEFAULT 'Confirmee'
) 
--
-- Indexes for dumped tables
--

--
-- Indexes for table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id_activite`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `idmembre` (`idmembre`),
  ADD KEY `idactivite` (`idactivite`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activite`
--
ALTER TABLE `activite`
  MODIFY `id_activite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idmembre`) REFERENCES `membre` (`id_membre`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idactivite`) REFERENCES `activite` (`id_activite`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ajouter un membre

-- Requête pour sélectionner un membre spécifique en fonction de son ID.
SELECT * FROM membre WHERE id_membre = 1;

-- Requête pour insérer une nouvelle réservation d'activité.
INSERT INTO reservation (idmembre, idactivite) 
VALUES (2, 1);

-- Requête pour mettre à jour la capacité d'une activité après une réservation.
UPDATE activite SET CAPACITE = CAPACITE - 1 WHERE id_activite = 1;

-- Requête pour supprimer un membre spécifique en fonction de son ID.
DELETE FROM membre WHERE id_membre = 3;

-- Requête pour obtenir les membres ayant des réservations et leurs statistiques.
SELECT 
    membre.*, 
    COUNT(DISTINCT reservation.id_reservation) AS numberReservations 
FROM 
    membre
LEFT JOIN reservation ON membre.id_membre = reservation.idmembre
GROUP BY 
    membre.id_membre;