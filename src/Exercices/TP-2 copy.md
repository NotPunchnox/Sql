# Exercice 4 

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

    ```

    Résultat:
    ```m

    ```

2. Le nombre d’élèves par classe

3. La personne la plus jeune

4. La personne la plus âgée

5. Le nombre d’élèves

6. Le nombre de profs

7. Retourner le nombre d’élèves et le nombre de profs en une seule requête

8. La moyenne générale de la classe 1TSSIO

9. La moyenne générale par classe

10. La moyenne générale de chaque élève

11. La moyenne générale pour chaque matière

12. La plus grande note obtenue par l’élève « Tony »

13. La plus haute et la plus basse note obtenue pour chaque élève

14. Le nombre d’élèves ayant une moyenne générale supérieure à 10

15. Les élèves dont la moyenne générale est égale ou inférieure à 10

16. Calculer la moyenne générale de la classe 1TSSIO **sans passer par la fonction AVG**

17. Le nombre de matières évaluées

18. La moyenne d‘âge des étudiants