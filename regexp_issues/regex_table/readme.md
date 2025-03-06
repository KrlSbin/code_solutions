Launch script examples

csv files are automatically generated
```
ruby regex_table_minitest.rb
```

Provide file with NULL contained rows 
```
ruby regex_table_minitest.rb origin.csv
```

Provide both files
```
ruby regex_table_minitest.rb origin.csv expected.csv
```

Origin file example
```
id,name,age,score
1,Oqsy,78,NULL
2,NULL,68,74.7
3,Acip,20,1.34
4,NULL,25,89.97
NULL,Dest,2,3.09
6,NULL,76,51.72
7,Npqu,19,NULL
NULL,Fouz,9,23.21
9,Jlvw,NULL,13.45
NULL,Fioz,53,69.08
NULL,Bdns,23,62.56
12,NULL,73,85.89
13,Cgkp,57,83.88
14,NULL,69,99.39
15,Glwy,24,NULL
16,Cdix,14,35.86
17,Benz,NULL,80.61
18,Klmn,85,92.43
19,Ghjk,2,93.2
20,Bjkx,NULL,69.05
```

Expected file example
```
id,name,age,score
3,Acip,20,1.34
13,Cgkp,57,83.88
16,Cdix,14,35.86
18,Klmn,85,92.43
19,Ghjk,2,93.2
```