# Exercice 4 

### Base de donnée utilisé: [`db_ecole.sql`](../DB/db_ecole.sqls) 

1. Liste des personnes n’ayant pas renseigné leur numéro de téléphone ni leur adresse e-mail:
```sql
select pers_nom from personne
where personne.pers_email is null
or personne.pers_tel is null;
```
Résultat:
```m
+----------+
| pers_nom |
+----------+
| REBREDO  |
| SANCHEZ  |
| COAT     |
| DCAPRIO  |
| MESSON   |
+----------+
```

2. Liste des personnes ayant renseigné une adresse-mail mais pas de n° de téléphone
```sql
select pers_nom from personne
where personne.pers_email is not null
and personne.pers_tel is null;
```
Résultat:
```m
+----------+
| pers_nom |
+----------+
| REBREDO  |
| SANCHEZ  |
| DCAPRIO  |
+----------+
```

3. Liste des personnes ayant renseigné un n° de téléphone mais pas d’adresse e-mail
```sql
select pers_nom from personne
where personne.pers_tel is not null
and personne.pers_email is null;
```
Résultat:
```m
+----------+
| pers_nom |
+----------+
| COAT     |
| MESSON   |
+----------+
```

4. Liste des hommes ayant renseigné soit un numéro de téléphone soit une adresse e-mail
```sql
select pers_nom from personne
where (personne.pers_tel is not null
or personne.pers_email is not null)
and personne.pers_sexe = 'M';
```
Résultat:
```m
+----------+
| pers_nom |
+----------+
| REBREDO  |
| MARCO    |
| SANCHEZ  |
| COAT     |
| DCAPRIO  |
| MESSON   |
+----------+
```

5. L’ensemble des notes émises dans l’ordre décroissant
```sql
select note_obtenue from notes
order by note_obtenue desc;
```
Résultat:
```m
+--------------+
| note_obtenue |
+--------------+
|           20 |
|           19 |
|           19 |
|           18 |
|           17 |
|           15 |
|           15 |
|           15 |
|           14 |
|           14 |
|           12 |
|           12 |
|           10 |
|            9 |
|            7 |
+--------------+
```

6. La liste des notes différentes attribuées (pas de doublons)
```sql
select distinct note_obtenue from notes;
```
Résultat:
```m
+--------------+
| note_obtenue |
+--------------+
|           15 |
|           12 |
|           17 |
|           19 |
|           18 |
|           20 |
|            9 |
|            7 |
|           14 |
|           10 |
+--------------+
```

7. La Liste des personnes dans l'ordre alphabétique du nom et dans l’ordre inverse du prénom
```sql
select pers_nom, pers_prenom from personne
order by pers_nom asc, pers_prenom desc;
```
Résultat:
```m
+----------+-------------+
| pers_nom | pers_prenom |
+----------+-------------+
| COAT     | José        |
| DCAPRIO  | Marco       |
| DUPONT   | Mireille    |
| MARCO    | Michel      |
| MARSON   | Marine      |
| MESSON   | John        |
| MILANO   | Karine      |
| REBREDO  | Tony        |
| SANCHEZ  | Carlos      |
+----------+-------------+
```

8. Le nom des femmes qui habitent LANESTER
```sql
select pers_nom, pers_prenom, pers_ville from personne
where pers_ville like 'LANESTER';
```
Résultat:
```m
+----------+-------------+------------+
| pers_nom | pers_prenom | pers_ville |
+----------+-------------+------------+
| SANCHEZ  | Carlos      | LANESTER   |
| COAT     | José        | LANESTER   |
| MARSON   | Marine      | LANESTER   |
+----------+-------------+------------+
```

9. Les noms et prénoms des personnes qui n’habitent pas en bretagne
```sql
select pers_nom, pers_prenom, pers_cp from personne
where pers_cp like '56%';
```
Résultat:
```m
+----------+-------------+---------+
| pers_nom | pers_prenom | pers_cp |
+----------+-------------+---------+
| SANCHEZ  | Carlos      | 56600   |
| COAT     | José        | 56600   |
| MARSON   | Marine      | 56600   |
| MESSON   | John        | 56100   |
+----------+-------------+---------+
```

10. La liste des personnes dont l’identifiant est supérieur 5 et inférieur à 9
```sql
select personne_id, pers_nom, pers_prenom from personne
where personne_id > 5 and personne_id < 9;
```
Résultat:
```m
+-------------+----------+-------------+
| personne_id | pers_nom | pers_prenom |
+-------------+----------+-------------+
|           6 | MARSON   | Marine      |
|           7 | MILANO   | Karine      |
|           8 | DCAPRIO  | Marco       |
+-------------+----------+-------------+
```
