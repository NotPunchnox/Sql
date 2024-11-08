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

```
Résultat:
```m

```

3. Liste des personnes n’ayant pas renseigné leur adresse e-mail ou leur n° de téléphone:

4. Liste des personnes dont le nom se termine la lettre O

5. Liste des personnes dans l'ordre alphabétique (nom puis prénom)

6. Liste des personnes (nom, prénom, ville) provenant du Morbihan

7. Nom et prénom du professeur qui enseigne SI3 ou SI4

8. Liste des personnes (nom, prénom, date de naissance au format français (01-12-2015)) nées entre 1989 et 1991 en utilisant la fonction YEAR

9. Liste des matières (nom court, nom long) se rapportant aux données (contenant le mot « données »)