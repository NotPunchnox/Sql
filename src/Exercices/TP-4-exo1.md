# Exercice 1
## Création et modification de base de donnée

### Base de donnée utilisé:
- Structure de la base de donnée voyage: [DB_Voyage](../DB/db_voyage.sql)
- Contenu de la base voyage: [Insert Voyage](../DB/insert_db_voyage.sql)



### Exercices

1) Ajouter les valeurs dans la table inscrits
```sql
insert into Inscrits values(1, 1, 1);
insert into Inscrits values(2, 2, 1);
insert into Inscrits values(3, 2, 2);
insert into Inscrits values(4, 3, 2);
insert into Inscrits values(5, 5, 3);
insert into Inscrits values(6, 6, 4);
insert into Inscrits values(7, 6, 5);
```

Résultat:
```m
+-------------+----------+---------+
| CodeInscrit | NoVoyage | CodeCli |
+-------------+----------+---------+
|           1 |        1 |       1 |
|           2 |        2 |       1 |
|           3 |        2 |       2 |
|           4 |        3 |       2 |
|           5 |        5 |       3 |
|           6 |        6 |       4 |
|           7 |        6 |       5 |
+-------------+----------+---------+
```

2) Récupérer le nombre de voyageurs par voyage
```sql
select novoyage, count(novoyage) as count from inscrits
group by novoyage;
```

Résultat:
```m
+----------+-------+
| novoyage | count |
+----------+-------+
|        1 |     1 |
|        2 |     2 |
|        3 |     1 |
|        5 |     1 |
|        6 |     2 |
+----------+-------+
```



3) Modifier dans la table `Voyages`, les valeurs du champ NbInscrits pour les voyages concernés
```sql
with InscritsParVoyage as (
    select novoyage, count(novoyage) as count from inscrits
    group by novoyage
)

update voyages set NbInscrits = (
    select count from InscritsParVoyage
    where InscritsParVoyage.novoyage = voyages.novoyage
)

where novoyage in (select novoyage from InscritsParVoyage);
```

Résultat:
```m
+----------+-------------------------------+------------+-------+------------+---------------+
| NoVoyage | LibVoyage                     | DateDebut  | Duree | NbInscrits | NoDestination |
+----------+-------------------------------+------------+-------+------------+---------------+
|        1 | Découverte de la Cappadoce    | 2011-06-01 |     7 |          1 |             1 |
|        2 | Randonnée en Anatolie         | 2011-07-04 |    15 |          2 |             1 |
|        3 | Grand tour de l anapurna      | 2011-10-01 |    25 |          1 |             8 |
|        4 | Découverte du Népal           | 2011-10-03 |    17 |          0 |             8 |
|        5 | Ile de Paques                 | 2011-10-25 |    15 |          1 |             9 |
|        6 | Randonnée le long du Nil      | 2011-10-18 |     9 |          2 |            10 |
|        7 | Le desert et le Nil           | 2011-10-25 |    16 |          0 |            10 |
|        8 | Traversée de l Atlas          | 2011-07-05 |    22 |          0 |            11 |
|        9 | Randonnées Atlantique         | 2011-07-12 |     8 |          0 |            11 |
|       10 | Traversée du Djebel Sarho     | 2011-10-04 |     8 |          0 |            11 |
|       11 | Canyons et Gargantuas         | 2011-06-29 |     7 |          0 |             7 |
|       12 |  Sierras du Haut Arragon      | 2011-07-19 |     8 |          0 |             7 |
|       13 |  De Darwin à Kangaroo Island  | 2011-06-06 |    24 |          0 |             4 |
|       14 |  Les iles Lofoten             | 2011-06-08 |    14 |          0 |             5 |
+----------+-------------------------------+------------+-------+------------+---------------+
```


4) Modifiez la date de début de voyage pour le voyage 1, nouvelle date de départ le : 07/06/11, Supprimer le voyage N° 15
```sql
update voyages
set DateDebut = '2011-06-07' where novoyage = 1;
```

Résultat:
```m
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```