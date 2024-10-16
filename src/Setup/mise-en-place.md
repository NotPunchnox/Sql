<link rel="stylesheet" href="{{ '/theme/styles/main.css' | relative_url }}">

# Mise en place de la base de données

## Prérequis
Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **Scoop** (facultatif) : gestionnaire de packages pour Windows.
- **MySQL** : Système de gestion de base de données relationnelle.
- **MariaDB** : Fork de MySQL, également un système de gestion de base de données relationnelle.

## Installation de Scoop
Scoop est un gestionnaire de packages qui facilite l'installation de logiciels sous Windows.

1. Ouvrez **PowerShell** en tant qu'administrateur.
2. Exécutez la commande suivante pour permettre l'exécution de scripts signés :
    ```bash
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
3. Installez **Scoop** en exécutant la commande suivante :
    ```bash
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    ```
4. Scoop est maintenant installé sur votre machine.

Plus d'informations : [scoop.sh](https://scoop.sh/)

## Installation de MySQL

Pour installer MySQL avec **Scoop**, exécutez la commande suivante dans PowerShell :

```bash
scoop install mysql
```

## Installation de MariaDB

Si vous souhaitez utiliser MariaDB à la place de MySQL, utilisez cette commande dans PowerShell :

```bash
scoop install mariadb
```

## Mise en place de la base de données pour les exercices

### 1. Démarrer le service MySQL ou MariaDB
Avant de procéder à l'importation de votre base de données, vous devez démarrer le service MySQL (ou MariaDB). Voici comment démarrer MySQL :

```bash
net start mysql
```

Pour MariaDB, si nécessaire :

```bash
net start mariadb
```

### 2. Importer la base de données TINTIN

Une fois le service démarré, vous pouvez importer votre base de données à partir du fichier SQL `TINTIN.sql`.

- Placez-vous dans le répertoire où se trouve votre fichier `TINTIN.sql`.
- Exécutez la commande suivante pour importer le fichier dans une base de données existante appelée `tintin` :


```bash
Get-Content chemin\vers\TINTIN.sql | mysql -u root -p
```

**Remplacez `chemin\vers\TINTIN.sql` par le chemin exact de votre fichier SQL.**

### 3. Vérifier que la base de données a été ajoutée
Après l'importation, vous pouvez vérifier que la base de données `tintin` est correctement importée :

1. Accédez à MySQL ou MariaDB :
   ```bash
   mysql -u root -p
   ```
2. Listez toutes les bases de données :
   ```sql
   SHOW DATABASES;
   ```
3. Utilisez la base de données `tintin` :
   ```sql
   USE tintin;
   ```
4. Listez les tables pour vérifier leur présence :
   ```sql
   SHOW TABLES;
   ```

---

## Utilisation de la base de données

Après avoir importé et vérifié votre base de données, vous pouvez exécuter des requêtes SQL pour les exercices. Par exemple :

### Exemple de requête SQL
Afficher tous les albums dans l'ordre alphabétique :

```sql
SELECT * FROM album ORDER BY titrealb ASC;
```

Cela affichera tous les albums triés par leur titre dans un ordre croissant (alphabétique).

---

### Notes importantes

- **MySQL vs MariaDB** : MariaDB est une version améliorée et libre de MySQL. Les commandes sont interchangeables, mais certaines fonctionnalités peuvent différer légèrement.
- **Scoop** n'est pas obligatoire, mais il facilite grandement l'installation de logiciels sous Windows. Vous pouvez aussi télécharger MySQL ou MariaDB manuellement depuis leurs sites officiels si nécessaire.
