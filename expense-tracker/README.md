# Expense tracker

an awk script that generates a tabular report summary of expenses.

The expenses are added to a separate file in a CSV format: `description,amount`.


# Synopsis

in terminal type:

```
awk -f report.awk [file]
```

where file is the expense file, given in the CSV format (see `sample.expense.dat`)


# Demonstration

Invoking the `report.awk` script on `sample.expense.dat` with the command:

```shell
awk -f report.awk sample.expense.dat
```

outputs the following report:

```
EXPENSE                   COST
------------------------------
rent                      2500
fuel                       300
sushi                       80
supermarket                350
breakfast                   50
gym                        200
netflix                     70
------------------------------
TOTAL:                    3550
```

