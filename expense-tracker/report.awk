
BEGIN {FS=","; sum=0; printf("%-20s\t%6s\n", "EXPENSE", "COST"); print "------------------------------"}

{sum += $2}
{printf("%-20s\t%6s\n", $1, $2)}

END {print "------------------------------"; printf("%-20s\t%6s\n", "TOTAL:", sum)}

