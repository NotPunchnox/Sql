# TP 2 Exercice 1

### Base de donnée utilisé: [`db_ecole.sql`](../DB/db_ecole.sqls) 

1. Liste de toutes les personnes de l'établissement:
```sql
select * from personne;
```
Résultat:
```m
+-------------+----------+-------------+-----------+------------------------+---------+-------------+---------------------+----------------------------+------------+
| PERSONNE_ID | PERS_NOM | PERS_PRENOM | PERS_SEXE | PERS_ADR               | PERS_CP | PERS_VILLE  | PERS_DATE_NAISSANCE | PERS_EMAIL                 | PERS_TEL   |
+-------------+----------+-------------+-----------+------------------------+---------+-------------+---------------------+----------------------------+------------+
|           1 | DUPONT   | Mireille    | F         | 65 rue Bernard Chochoy | 62570   | WIZERNES    | 1969-04-29          | candy@monadresseemail.com  | 0365876976 |
|           2 | REBREDO  | Tony        | M         | 10 rue de Kerdual      | 29100   | COMBRIT     | 1992-04-12          | tony@monadresseemail.com   | NULL       |
|           3 | MARCO    | Michel      | M         | 106 rue des acacias    | 35760   | MONTGERMONT | 1990-06-30          | michel@monadresseemail.com | 0299876976 |
|           4 | SANCHEZ  | Carlos      | M         | 10 rue Belle Ville     | 56600   | LANESTER    | 1992-04-29          | carlos@monadresseemail.com | NULL       |
|           5 | COAT     | José        | M         | 40 rue de Lorient      | 56600   | LANESTER    | 1992-10-12          | NULL                       | 0297876976 |
|           6 | MARSON   | Marine      | F         | 65 rue de Luscanen     | 56600   | LANESTER    | 1991-11-03          | marine@monadresseemail.com | 0297876976 |
|           7 | MILANO   | Karine      | F         | 51 rue de mars         | 29100   | COMBRIT     | 1991-05-05          | karine@monadresseemail.com | 0298876976 |
|           8 | DCAPRIO  | Marco       | M         | 01 route de l'ile-tudy | 29100   | COMBRIT     | 1992-01-01          | marco@monadresseemail.com  | NULL       |
|           9 | MESSON   | John        | M         | 25 rue du Moustoir     | 56100   | LORIENT     | 1957-02-14          | NULL                       | 0297876976 |
+-------------+----------+-------------+-----------+------------------------+---------+-------------+---------------------+----------------------------+------------+
```

2. Liste des filles de l’établissement:
```sql
select pers_sexe, pers_nom, pers_prenom from personne
where pers_sexe = "F";
```
Résultat:
```m
+-----------+----------+-------------+
| pers_sexe | pers_nom | pers_prenom |
+-----------+----------+-------------+
| F         | DUPONT   | Mireille    |
| F         | MARSON   | Marine      |
| F         | MILANO   | Karine      |
+-----------+----------+-------------+
```

3. Liste des personnes n’ayant pas renseigné leur adresse e-mail ou leur n° de téléphone:
```sql
select * from personne
where pers_email is null or pers_tel is null;
```
Résultat:
```m
+-------------+----------+-------------+-----------+------------------------+---------+------------+---------------------+----------------------------+------------+
| PERSONNE_ID | PERS_NOM | PERS_PRENOM | PERS_SEXE | PERS_ADR               | PERS_CP | PERS_VILLE | PERS_DATE_NAISSANCE | PERS_EMAIL                 | PERS_TEL   |
+-------------+----------+-------------+-----------+------------------------+---------+------------+---------------------+----------------------------+------------+
|           2 | REBREDO  | Tony        | M         | 10 rue de Kerdual      | 29100   | COMBRIT    | 1992-04-12          | tony@monadresseemail.com   | NULL       |
|           4 | SANCHEZ  | Carlos      | M         | 10 rue Belle Ville     | 56600   | LANESTER   | 1992-04-29          | carlos@monadresseemail.com | NULL       |
|           5 | COAT     | José        | M         | 40 rue de Lorient      | 56600   | LANESTER   | 1992-10-12          | NULL                       | 0297876976 |
|           8 | DCAPRIO  | Marco       | M         | 01 route de l'ile-tudy | 29100   | COMBRIT    | 1992-01-01          | marco@monadresseemail.com  | NULL       |
|           9 | MESSON   | John        | M         | 25 rue du Moustoir     | 56100   | LORIENT    | 1957-02-14          | NULL                       | 0297876976 |
+-------------+----------+-------------+-----------+------------------------+---------+------------+---------------------+----------------------------+------------+
```

4. Liste des personnes dont le nom se termine la lettre O
```sql
select pers_prenom from personne
where pers_prenom like "%o";
```
Résultat:
```m
+-------------+
| pers_prenom |
+-------------+
| Marco       |
+-------------+
```

5. Liste des personnes dans l'ordre alphabétique (nom puis prénom)
```sql
select pers_nom, pers_prenom from personne
order by pers_nom, pers_prenom asc;
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

6. Liste des personnes (nom, prénom, ville) provenant du Morbihan
```sql
select pers_nom, pers_prenom, pers_ville from personne
where personne.pers_cp like "56%";
```
Résultat:
```m
+----------+-------------+------------+
| pers_nom | pers_prenom | pers_ville |
+----------+-------------+------------+
| SANCHEZ  | Carlos      | LANESTER   |
| COAT     | José        | LANESTER   |
| MARSON   | Marine      | LANESTER   |
| MESSON   | John        | LORIENT    |
+----------+-------------+------------+
```

7. Nom et prénom du professeur qui enseigne SI3 ou SI4
```sql
select pers_prenom, pers_nom from personne
join professeur on professeur.professeur_id = personne.personne_id
join enseigner on enseigner.ensg_prof_id = professeur.professeur_id
join matiere on matiere.matiere_id = enseigner.ensg_matr_id
where matiere.matr_nom_court = "SI3" or matiere.matr_nom_court = "SI4";
```
Résultat:
```m
+-------------+----------+
| pers_prenom | pers_nom |
+-------------+----------+
| Mireille    | DUPONT   |
| John        | MESSON   |
+-------------+----------+
```

8. Liste des personnes (nom, prénom, date de naissance au format français (01-12-2015)) nées entre 1989 et 1991 en utilisant la fonction YEAR
```sql
select pers_nom, pers_prenom, date_format(pers_date_naissance, "%d-%M-%Y") from personne
where year(pers_date_naissance)>1989
and year(pers_date_naissance)<1991;
```
Résultat:
```m
+----------+-------------+----------------------------------------------+
| pers_nom | pers_prenom | date_format(pers_date_naissance, "%d-%M-%Y") |
+----------+-------------+----------------------------------------------+
| MARCO    | Michel      | 30-June-1990                                 |
+----------+-------------+----------------------------------------------+
```

9. Liste des matières (nom court, nom long) se rapportant aux données (contenant le mot « données »)
```sql
select matr_nom_long, matr_nom_court from matiere
where matr_nom_long like "%données%";
```
Résultat:
```md
+-------------------------------------------------+----------------+
| matr_nom_long                                   | matr_nom_court |
+-------------------------------------------------+----------------+
| Exploitation des bases de données               | SI3            |
| Exploitation d'un schéma de données             | SLAM1          |
| Conception et adaptation d'une base de données  | SLAM3          |
+-------------------------------------------------+----------------+
```