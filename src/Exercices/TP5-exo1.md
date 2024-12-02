# Droits des Utilisateurs sur la Base de Données

## Liste des privièges
```m
+-------------------------------+----------+----------+-----------------------------------------------+
| Nom                           | Classe   | Niveau   | Droit                                         |
+-------------------------------+----------+----------+-----------------------------------------------+
| USAGE                         | Serveur  | User     | Pour créer un utilisateur sans droits.        |
+-------------------------------+----------+----------+-----------------------------------------------+
| ALL [PRIVILEGES] WITH GRANT   | Serveur  | User     | Tous les privilèges, sauf WITH GRANT OPTION.  |
| OPTION                        |          |          |                                               |
+-------------------------------+----------+----------+-----------------------------------------------+
| GRANT                         | Serveur  | User     | Autorise l utilisation de GRANT.              |
+-------------------------------+----------+----------+-----------------------------------------------+

+-------------------------------+----------+----------+-----------------------------------------------+
| Nom                           | Classe   | Niveau   | Droit                                         |
+-------------------------------+----------+----------+-----------------------------------------------+
| CREATE                        | Serveur  | BD, Table| Création (toutes les créations possibles).    |
+-------------------------------+----------+----------+-----------------------------------------------+
| DROP                          | Serveur  | BD, Table| Destruction de bases ou de tables.            |
+-------------------------------+----------+----------+-----------------------------------------------+
| ALTER                         | Serveur  | Table    | Autorise l'utilisation de ALTER.              |
+-------------------------------+----------+----------+-----------------------------------------------+

+-------------------------------+----------+----------+-----------------------------------------------+
| Nom                           | Classe   | Niveau   | Droit                                         |
+-------------------------------+----------+----------+-----------------------------------------------+
| SHOW DATABASES                | Client   | User     | Autorise l'utilisation de SHOW DATABASES.     |
+-------------------------------+----------+----------+-----------------------------------------------+
| SELECT                        | Client   | Tuples   | Autorise l'utilisation de SELECT.             |
+-------------------------------+----------+----------+-----------------------------------------------+
| INSERT                        | Client   | Tuples   | Autorise l'utilisation de INSERT.             |
+-------------------------------+----------+----------+-----------------------------------------------+
| UPDATE                        | Client   | Tuples   | Autorise l'utilisation de UPDATE.             |
+-------------------------------+----------+----------+-----------------------------------------------+
| DELETE                        | Client   | Tuples   | Autorise l'utilisation de DELETE.             |
+-------------------------------+----------+----------+-----------------------------------------------+

```

## Groupes et Utilisateurs de la Base
```m
+--------------+------------------+---------------------------------------------------------------------------+
| Utilisateurs | Tables           | Droits                                                                    |
|--------------|------------------|---------------------------------------------------------------------------|
|   Admin      | VOYAGES          | Tous les droits sur les tables, ainsi que sur la base de données          |
|              | DESTINATIONS     |                                                                           |
|              | INSCRITS         |                                                                           |
|              | CLIENTS          |                                                                           |
|--------------|------------------|---------------------------------------------------------------------------|
|   Vendeurs   | VOYAGES          | Insertions, modifications, suppressions dans toutes les tables de la base |
|              | DESTINATIONS     |                                                                           |
|              | INSCRITS         |                                                                           |
|              | CLIENTS          |                                                                           |
|--------------|------------------|---------------------------------------------------------------------------|
|   Clients    | VOYAGES          | Lecture des tables Voyages et Destinations                                |
|              | DESTINATIONS     | Insertions dans la table Clients                                          |
|              | INSCRITS         | Modification des champs AdrCli et TelCli de la table Clients              |
|              | CLIENTS          |                                                                           |
+--------------+------------------+---------------------------------------------------------------------------+
```

## Travail à Faire

```sql
-- Proverbe Japonais:
Grant quoi on où to quoi
```

1. **Créer un utilisateur de chaque type**
    - Créer les utilisateurs Admin, Vendeur, et Client en leur attribuant des droits spécifiques selon le tableau.

    a) __Commande pour créer les utilisateurs__
    ```sql
    create user Admin@localhost identified by 'password';
    create user Vendeurs@localhost identified by 'password';
    create user Clients@localhost identified by 'password';
    ```

    b) __Commande pour ajouter les permissions__
    ```sql
    --Permission de Admin
    grant all privileges on *.* to Admin@localhost;

    --Permission de Vendeurs
    grant insert, update, drop on voyages.* to Vendeurs@localhost;

    -- Permission de Clients
    grant select on voyages.voyages to Clients@localhost;
    grant select on voyages.destinations to Clients@localhost;

    grant insert on voyages.clients to Clients@localhost;
    grant update(AdrCli, TelCli) on voyages.clients to Clients@localhost;
    ```

    b) __Commande pour voir les utilisateurs__
    ```sql
    select user from mysql.user

    -- Commande avec plus de détails
    select user, host, Select_priv, insert_priv, update_priv from mysql.user
    ```

    Résultat:
    ```m
    +------------------+-----------+-------------+-------------+-------------+
    | user             | host      | Select_priv | insert_priv | update_priv |
    +------------------+-----------+-------------+-------------+-------------+
    | Admin            | localhost | Y           | Y           | Y           |
    | Clients          | localhost | N           | N           | N           |
    | Vendeurs         | localhost | N           | Y           | Y           |
    | mysql.infoschema | localhost | Y           | N           | N           |
    | mysql.session    | localhost | N           | N           | N           |
    | mysql.sys        | localhost | N           | N           | N           |
    | root             | localhost | Y           | Y           | Y           |
    +------------------+-----------+-------------+-------------+-------------+
    ```