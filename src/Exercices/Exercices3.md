# Exercices 3 

### Base de donnée: Tintin.sql

1. Lister les pays dans lesquels se déroule l'album "LE CRABE AUX PINCES D'OR":
```sql
select * from pays
join derouler on derouler.nopays = pays.nopays
join album on album.noalb = derouler.noalb
where album.titrealb like "LE CRABE AUX PINCES D'OR";
```

```md 
+--------+----------+-------+--------+-------+--------------------------+---------+
| nopays | nompays  | noalb | nopays | noalb | titrealb                 | datealb |
+--------+----------+-------+--------+-------+--------------------------+---------+
|      3 | BELGIQUE |     8 |      3 |     8 | LE CRABE AUX PINCES D'OR |    1940 |
|      4 | MAROC    |     8 |      4 |     8 | LE CRABE AUX PINCES D'OR |    1940 |
+--------+----------+-------+--------+-------+--------------------------+---------+
```

2. Lister le titre des albums dans lequel participe Tintin:
```sql
select titrealb from album
join participer on participer.noalb = album.noalb
join personnage on personnage.nopers = participer.nopers
where personnage.nompers = "TINTIN";
```
```md 
+--------------------------+
| titrealb                 |
+--------------------------+
| TINTIN AU CONGO          |
| TINTIN EN AMERIQUE       |
| LE CRABE AUX PINCES D'OR |
+--------------------------+
```

3. Lister les albums parus avant 1940:
```sql
select titrealb from album
where album.datealb < 1940;
```
```md 
+--------------------+
| titrealb           |
+--------------------+
| TINTIN AU CONGO    |
| TINTIN EN AMERIQUE |
+--------------------+
```

4. Lister les personnages qui ont un prénom ou qui sont reporter:
```sql
select nompers from personnage
where personnage.fonction = "REPORTER" OR personnage.nompers != "";
```
```md
+---------+
| nompers |
+---------+
| TINTIN  |
| HADDOCK |
+---------+
```
5. Lister les personnages qui ont un prénom et qui sont reporter:
```sql
select nompers from personnage
where personnage.fonction = "REPORTER" AND personnage.nompers != "";
```
```md
+---------+
| nompers |
+---------+
| TINTIN  |
+---------+
```

6. Lister les personnages qui n’ont pas de prénom ou qui sont reporter:

```sql
select nompers from personnage
where personnage.fonction = "REPORTER" OR personnage.nompers = "";
```
```md
+---------+
| nompers |
+---------+
| TINTIN  |
+---------+
```
