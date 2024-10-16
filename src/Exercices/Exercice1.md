<link rel="stylesheet" href="{{ '/theme/styles/main.css' | relative_url }}">

# Exercice 1

Voici la représentation des bases de données :

### Table `album`

| **NOALB** | **TITREALB**                | **DATEALB** |
|-----------|------------------------------|-------------|
| 1         | TINTIN AU CONGO               | 1930        |
| 2         | TINTIN EN AMERIQUE            | 1931        |
| 8         | LE CRABE AUX PINCES D'OR      | 1940        |

### Table `personnage`

| **NOPERS** | **NOMPERS**  | **PRENOM**  | **FONCTION** | **SEXE** | **GENTIL** |
|------------|--------------|-------------|--------------|----------|------------|
| 1          | TINTIN       | REPORTER    | M            | OUI      |
| 2          | HADDOCK      | CAPITAINE   | M            | OUI      |

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
SELECT titrealb 
FROM album 
WHERE noalb NOT IN ( SELECT noalb FROM participer WHERE nopers = 2);
--- 2 = Id du capitaine Hadock
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
SELECT A.titrealb FROM album A
JOIN derouler D ON A.noalb = D.noalb
WHERE D.nopays = 3;
-- Le numéro de la Belgique dans la table pays
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