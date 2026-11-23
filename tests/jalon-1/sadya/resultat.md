# Jalon 1 — Fiche de résultats

**Nom :** Sadya  
**Date :** 20 novembre 2026

## 1. Environnement de travail

- Système : Windows 10 Professionnel
- Version : 22H2
- Build : 19045.6466
- Langue : Français (France)
- Python : 3.15.2
- PostgreSQL : 18.7
- Port PostgreSQL : 5432

## 2. Audit Windows

- Audit des ouvertures de session : Succès et échecs activés.
- Compte de test : labo_test
- Événement recherché : 4625
- Nombre d'événements générés : 6
- Type de connexion : 3
- Résultat : événements 4625 détectés dans le journal de sécurité Windows.

## 3. Exportation et lecture des événements

- Exportation PowerShell : réussie.
- Fichier JSON généré : tests/evenements-4625.json
- Lecture avec Python : réussie.
- Nombre d'événements lus : 6.
- Résultat : les événements ont été correctement extraits et affichés.

## 4. Configuration PostgreSQL

- Version installée : PostgreSQL 18.7
- Service Windows : postgresql-x64-18
- État du service : Running
- Port : 5432
- Utilisateur de la base : orbit
- Base de données : orbit_dev
- Propriétaire de la base : orbit
- Connexion avec l'utilisateur orbit : réussie.

## 5. Configuration du projet ORBIT

- Dépôt GitHub cloné : réussi.
- Fichier `.env` créé : oui.
- Adresse de connexion PostgreSQL configurée : oui.
- Fichier `.env` ignoré par Git : vérifié.

## 6. Difficultés rencontrées

- Présence initiale de PostgreSQL 19 alors que le groupe utilise PostgreSQL 18.
- Installation incomplète de PostgreSQL 18, nécessitant une réinstallation.
- Création et vérification du service PostgreSQL 18.
- Réinitialisation du mot de passe de l'utilisateur orbit.

**Solutions :** suppression de l'ancienne installation, réinstallation de PostgreSQL 18.7 et vérification du service et de la connexion à la base de données.

## 7. Bilan

Les étapes d'audit Windows, d'exportation JSON, de lecture Python et de configuration PostgreSQL ont été réalisées avec succès.

**Temps total consacré :** À compléter.