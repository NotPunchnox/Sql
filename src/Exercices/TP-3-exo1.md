# Exercice 4 
## Les agrégations

### Base de donnée utilisé: [`db_ecole.sql`](../DB/db_ecole.sqls)

---

## Rappel

**Ordre des clauses dans une requête SQL :**

1. **SELECT**
2. **FROM**
3. [ NATURAL | CROSS | INNER | [ LEFT | RIGHT ] OUTER ] JOIN (optionnel)
4. **WHERE** (optionnel)
5. AND | OR (optionnel) à autant de fois qu’il y a de filtres à appliquer
6. **GROUP BY** (optionnel)
7. **HAVING** (optionnel)
8. **ORDER BY** (optionnel)

**Il existe plusieurs fonctions chacune permettant de réaliser une action précise :**

1. **AVG()** -> Permet de calculer une moyenne
2. **SUM()** -> Permet de réaliser une addition (somme)
3. **MIN()** -> Permet de récupérer la plus petite valeur
4. **MAX()** -> Permet de récupérer la plus grande valeur
5. **COUNT()** -> Permet de compter le nombre de lignes que retourne la requête.


## Exercices:


1. Le nombre de personnes figurant dans la base de données
```sql
select count(*) from personne;
```

Résultat:
```m
+----------+
| count(*) |
+----------+
|        9 |
+----------+
```

2. Le nombre d’élèves par classe
```sql
select classe.clas_nom as Classe, count(appartenir.appa_elev_id) as "Nombre d'élèves" from classe
join appartenir on classe.classe_id = appartenir.appa_clas_id
group by classe.classe_id, classe.clas_nom;
```

Résultat:
```
+--------+-------------------+
| Classe | Nombre d'élèves   |
+--------+-------------------+
| 1TSSIO |                 4 |
| 2TSSIO |                 3 |
+--------+-------------------+
```

3. La personne la plus jeune
```sql
select pers_nom, pers_prenom, pers_date_naissance
from personne
where pers_date_naissance = (select max(pers_date_naissance) from personne);
```

Résultat:
```m
+----------+-------------+---------------------+
| pers_nom | pers_prenom | pers_date_naissance |
+----------+-------------+---------------------+
| COAT     | José        | 1992-10-12          |
+----------+-------------+---------------------+
```

4. La personne la plus âgée
```sql
select pers_nom, pers_prenom, pers_date_naissance
from personne
where pers_date_naissance = (select min(pers_date_naissance) from personne);
```

Résultat:
```m
+----------+-------------+---------------------+
| pers_nom | pers_prenom | pers_date_naissance |
+----------+-------------+---------------------+
| MESSON   | John        | 1957-02-14          |
+----------+-------------+---------------------+
```

5. Le nombre d’élèves
```sql
select count(*) from eleve;
```

Résultat:
```m
+----------+
| count(*) |
+----------+
|        7 |
+----------+
```

6. Le nombre de profs
```sql
select count(*) from professeur;
```

Résultat:
```m
+----------+
| count(*) |
+----------+
|        2 |
+----------+
```

7. Retourner le nombre d’élèves et le nombre de profs en une seule requête
```sql
select
( select count(*) from professeur) as "Nombre de professeurs",
( select count(*) from eleve) as "Nombre d'élèves";
```

Résultat:
```m
+-----------------------+-------------------+
| Nombre de professeurs | Nombre d'élèves   |
+-----------------------+-------------------+
|                     2 |                 7 |
+-----------------------+-------------------+
```

8. La moyenne générale de la classe 1TSSIO
```sql
select AVG(note_obtenue) as Moyenne from notes
join evaluation on notes.note_eval_id = evaluation.evaluation_id
join classe on classe.classe_id = evaluation.eval_clas_id
where classe.clas_nom = "1TSSIO";
```

Résultat:
```m
+---------+
| Moyenne |
+---------+
| 14.5833 |
+---------+
```

9. La moyenne générale par classe
```sql
select clas_nom as nom_classe, ROUND(AVG(note_obtenue), 2) as Moyenne from notes
join evaluation on notes.note_eval_id = evaluation.evaluation_id
join classe on classe.classe_id = evaluation.eval_clas_id
group by classe.clas_nom;
```

Résultat:
```m
+------------+---------+
| nom_classe | Moyenne |
+------------+---------+
| "1TSSIO"   |   14.58 |
| "2TSSIO"   |   13.67 |
+------------+---------+
```

10. La moyenne générale de chaque élève
```sql
select personne.pers_nom as Nom, personne.pers_prenom as Prénom, ROUND(AVG(note_obtenue), 2) as Moyenne from notes

join evaluation on notes.note_eval_id = evaluation.evaluation_id
join eleve on eleve.eleve_id = notes.note_elev_id
join personne on personne.personne_id = eleve.eleve_id

group by eleve.eleve_id;
```

Résultat:
```m
+---------+---------+---------+
| Nom     | Prénom  | Moyenne |
+---------+---------+---------+
| REBREDO | Tony    |   14.67 |
| SANCHEZ | Carlos  |   19.00 |
| COAT    | José    |   10.00 |
| DCAPRIO | Marco   |   14.67 |
| MARCO   | Michel  |   19.00 |
| MARSON  | Marine  |   12.00 |
| MILANO  | Karine  |   10.00 |
+---------+---------+---------+
```

11. La moyenne générale pour chaque matière
```sql
select ROUND(AVG(notes.note_obtenue), 2) as Eval, matr_nom_court as Matière from matiere
join evaluation on evaluation.eval_matr_id = matiere.matiere_id
join notes on notes.note_eval_id = evaluation.eval_matr_id

group by matr_nom_court;
```

Résultat:
```m
+-------+----------+
| Eval  | Matière  |
+-------+----------+
| 14.25 | SI3      |
| 13.50 | SLAM1    |
| 13.67 | SLAM3    |
+-------+----------+
```

12. La plus grande note obtenue par l’élève « Tony »
```sql
select max(note_obtenue) from notes
join personne on personne.personne_id = notes.note_elev_id
where personne.pers_prenom = "Tony";
```

Résultat:
```m
+-------------------+
| max(note_obtenue) |
+-------------------+
|                17 |
+-------------------+
```

13. La plus haute et la plus basse note obtenue pour chaque élève
```sql
select min(note_obtenue) as "Note la plus basse", max(note_obtenue) as "Note la plus haute", personne.pers_nom, personne.pers_prenom from notes
join personne on personne.personne_id = notes.note_elev_id
group by personne.personne_id;
```

Résultat:
```m
+--------------------+--------------------+----------+-------------+
| Note la plus basse | Note la plus haute | pers_nom | pers_prenom |
+--------------------+--------------------+----------+-------------+
|                 12 |                 17 | REBREDO  | Tony        |
|                 19 |                 19 | MARCO    | Michel      |
|                 18 |                 20 | SANCHEZ  | Carlos      |
|                  7 |                 14 | COAT     | José        |
|                 12 |                 12 | MARSON   | Marine      |
|                 10 |                 10 | MILANO   | Karine      |
|                 14 |                 15 | DCAPRIO  | Marco       |
+--------------------+--------------------+----------+-------------+
```

14. Le nombre d’élèves ayant une moyenne générale supérieure à 10
```sql
select count(*) as "Nombre d'élèves" from (

    select eleve.eleve_id from notes
    join evaluation on notes.note_eval_id = evaluation.evaluation_id
    join eleve on eleve.eleve_id = notes.note_elev_id

    group by eleve.eleve_id
    having AVG(notes.note_obtenue) > 10

) as Moyenne;
```

Résultat:
```m
+-------------------+
| Nombre d élèves   |
+-------------------+
|                 5 |
+-------------------+
```

15. Les élèves dont la moyenne générale est égale ou inférieure à 10
```sql
select count(*) as "Nombre d'élèves" from (

    select eleve.eleve_id from notes
    join evaluation on notes.note_eval_id = evaluation.evaluation_id
    join eleve on eleve.eleve_id = notes.note_elev_id

    group by eleve.eleve_id
    having AVG(notes.note_obtenue) <= 10

) as Moyenne;
```


Résultat:
```m
+-------------------+
| Nombre d élèves   |
+-------------------+
|                 2 |
+-------------------+
```

16. Calculer la moyenne générale de la classe 1TSSIO **sans passer par la fonction AVG**
```sql
select round(sum(note_obtenue) / count(note_obtenue), 2) as Moyenne from notes
join evaluation on notes.note_eval_id = evaluation.evaluation_id
join classe on classe.classe_id = evaluation.eval_clas_id
where classe.clas_nom = "1TSSIO";
```

Résultat:
```m
+---------+
| Moyenne |
+---------+
|  14.58  |
+---------+
```

17. Le nombre de matières évaluées
```sql
select count(matiere_id) as "Nombre matière evaluées" from matiere
join evaluation e on e.evaluation_id = matiere.matiere_id
```

Résultat:
```m
+---------------------------+
| Nombre matière evaluées   |
+---------------------------+
|                         4 |
+---------------------------+
```

18. La moyenne d‘âge des étudiants
```sql
select TIMESTAMPDIFF(YEAR, PERS_DATE_NAISSANCE, CURDATE()) as "Moyenne d'age" from personne
join eleve on eleve.eleve_id = personne_id;
```

Résultat:
```md
+---------------+
| Moyenne d'age |
+---------------+
|            32 |
|            34 |
|            32 |
|            32 |
|            33 |
|            33 |
|            32 |
+---------------+
```