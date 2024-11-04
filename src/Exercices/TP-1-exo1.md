<!-- <link rel="stylesheet" href="{{ '/theme/main.css' | relative_url }}"> -->

# Exercice 1

Voici la représentation des bases de données :

### Table `album`

| **NOALB** | **TITREALB**                  | **DATEALB** |
|-----------|-------------------------------|-------------|
| 1         | TINTIN AU CONGO               | 1930        |
| 2         | TINTIN EN AMERIQUE            | 1931        |
| 8         | LE CRABE AUX PINCES D'OR      | 1940        |

### Table `personnage`

| **NOPERS** | **NOMPERS**  | **PRENOM**  | **FONCTION** | **SEXE** | **GENTIL** |
|------------|--------------|-------------|--------------|----------|------------|
| 1          | TINTIN       | REPORTER    | M            | OUI      |            |
| 2          | HADDOCK      | CAPITAINE   | M            | OUI      |            |

### Table `participer`

| **NOALB** | **NOPERS** |
|-----------|------------|
| 1         | 1          |
| 2         | 1          |
| 8         | 1          |
| 8         | 2          |

### Table `pays`

| **NOPAYS** | **NOMPAYS** |
|------------|-------------|
| 1          | CONGO       |
| 2          | AMERIQUE    |
| 3          | BELGIQUE    |
| 4          | MAROC       |

### Table `derouler`

| **NOALB** | **NOPAYS** |
|-----------|------------|
| 1         | 1          |
| 2         | 2          |
| 8         | 3          |

----

## Questions & Réponses:

**1° - Quels sont les titres des albums ?**

**Commande:**
```sql
SELECT * FROM album;
```

- TINTIN AU CONGO
- TINTIN EN AMERIQUE
- LE CRABE AUX PINCES D'OR
        
    
**2° - Quels sont les titres par ordre alphabétique ?**
**Commande:**
```sql
SELECT titrealb FROM album ORDER BY titrealb ASC;
```

**Résultat:**
```
+--------------------------+
| titrealb                 |
+--------------------------+
| LE CRABE AUX PINCES D'OR |
| TINTIN AU CONGO          |
| TINTIN EN AMERIQUE       |
+--------------------------+
3 rows in set (0.06 sec)
```


**3° - Dans quel album ne trouve-t-on pas le capitaine haddock ?**
        
```sql
-- METHODE LA PLUS IMPORTANTE:
-- Code avec jointure et sans déclaration de variables:
SELECT titrealb FROM album
WHERE album.noalb NOT IN (
    SELECT noalb FROM participer
    JOIN personnage ON participer.nopers = personnage.nopers
    WHERE personnage.nompers = 'HADDOCK'
);


-- En une ligne Et sans jointure
SELECT titrealb FROM album
WHERE noalb NOT IN (
    SELECT noalb FROM participer
    WHERE (
        SELECT nopers FROM personnage
        WHERE nompers = 'HADDOCK'
    )
    LIKE nopers
);

-- Requête avec déclaration de variables pour la réduire:
SELECT a.titrealb FROM album a
WHERE a.noalb NOT IN (
    SELECT p.noalb 
    FROM participer p
    JOIN personnage pers ON p.nopers = pers.nopers
    WHERE pers.nompers = 'HADDOCK'
);


```
```
+--------------------+
| titrealb           |
+--------------------+
| TINTIN AU CONGO    |
| TINTIN EN AMERIQUE |
+--------------------+
2 rows in set (0.00 sec)
```


**4° - Quel album se déroule en Belgique ?**
```sql
-- Sans déclaration de variables
SELECT titrealb FROM album
JOIN derouler on album.noalb = derouler.noalb
JOIN pays on pays.nopays = derouler.nopays
WHERE pays.nompays = 'BELGIQUE';

-- Avec déclaration de variables pour réduire la requête
SELECT a.titrealb FROM album a
JOIN derouler d on a.noalb = d.noalb
JOIN pays p on p.nopays = d.nopays
WHERE p.nompays = 'BELGIQUE';
```
```
+--------------------------+
| titrealb                 |
+--------------------------+
| LE CRABE AUX PINCES D'OR |
+--------------------------+
1 row in set (0.00 sec)
```

### Représentation graphique
```r
+--------------------+            +--------------------+            +-------------------+
|       album        |            |      derouler      |            |       pays        |
+--------------------+            +--------------------+            +-------------------+
| NOALB | TITREALB   |            | NOALB  | NOPAYS    |            | NOPAYS | NOMPAYS  |
+-------+------------+            +--------+-----------+            +--------+----------+
|   1   | TINTIN AU  |            |   1    |    1      |            |    1   | CONGO    |
|       | CONGO      |            |   2    |    2      |            |    2   | AMERIQUE |
|   2   | TINTIN EN  |<-----------|  '8'   |   '3'     |------------|   '3'  |'BELGIQUE'|
|       | AMERIQUE   |            +--------------------+            |    4   | MAROC    |
|  '8'  |'LE CRABE'  |                                              +-------------------+
|       |'AUX PINCES'|
|       |'D OR'      |
+--------------------+

Résultat attendu pour la Belgique: LE CRABE AUX PINCES D'OR
```
