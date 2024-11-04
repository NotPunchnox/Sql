# Exercices 2:

### base de donnée: Tintin.sql

1. **Lister l’ensemble des informations concernant les personnages:**
```sql
select * from personnage;
```

```md
+--------+---------+--------+-----------+------+--------+
| nopers | nompers | prenom | fonction  | sexe | gentil |
+--------+---------+--------+-----------+------+--------+
|      1 | TINTIN  | NULL   | REPORTER  | M    | OUI    |
|      2 | HADDOCK | NULL   | CAPITAINE | M    | OUI    |
+--------+---------+--------+-----------+------+--------+
```


2. **Afficher le titre et la date de de chaque albums:**
```sql
select titrealb, datealb from album;
```

```md
+--------------------------+---------+
| titrealb                 | datealb |
+--------------------------+---------+
| TINTIN AU CONGO          |    1930 |
| TINTIN EN AMERIQUE       |    1931 |
| LE CRABE AUX PINCES D'OR |    1940 |
+--------------------------+---------+
```

3. **Lister les albums par ordre chronologique (du plus ancien au plus récent):**
```sql
select titrealb, datealb from album order by asc;
```

```md
+--------------------------+---------+
| titrealb                 | datealb |
+--------------------------+---------+
| TINTIN AU CONGO          |    1930 |
| TINTIN EN AMERIQUE       |    1931 |
| LE CRABE AUX PINCES D'OR |    1940 |
+--------------------------+---------+
```

4. **Lister le contenu de la table DEROULER (3 requêtes à écrire)**

    - trié par ordre croissant du N°Album et décroissant du N°Pays

    ```sql
    select noalb, nopays from derouler order by noalb asc, nopays desc;
    ```
    ```md
    +-------+--------+
    | noalb | nopays |
    +-------+--------+
    |     1 |      1 |
    |     2 |      2 |
    |     8 |      4 |
    |     8 |      3 |
    +-------+--------+
    ```
    - trié par ordre décroissant du N°Album et croissant du N°Pays
    ```sql
     select noalb, nopays from derouler order by noalb desc, nopays asc;
     ```
     ```md
    +-------+--------+
    | noalb | nopays |
    +-------+--------+
    |     8 |      3 |
    |     8 |      4 |
    |     2 |      2 |
    |     1 |      1 |
    +-------+--------+
     ```

    - trié par ordre décroissant du N°Album et décroissant du N°Pays
    
    ```sql
    select noalb, nopays from derouler order by noalb desc, nopays desc;
    ```

    ```md
    +-------+--------+
    | noalb | nopays |
    +-------+--------+
    |     8 |      4 |
    |     8 |      3 |
    |     2 |      2 |
    |     1 |      1 |
    +-------+--------+
    ```
