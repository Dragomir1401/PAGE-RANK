             _______________________________
            |                               |
            |       DRAGOMIR ANDREI         |
            |           312CA               |
            |                               |
            |_______________________________|




*** PageRank ***


---------Purpose----------

    PageRank is an algorithm which analises hyperlinks on Internet, using Google
to get a share of each element from a lot. The purpose is to measure the importance
of each element in the lot.

    We are using two methods of calculating the PageRank index: iterative and algebric.
This project is made during the course of Numerical Methods in first year.

--------Implementation--------


------#### Iterative ####------

    Using recurence R(t+1) = d * M * R(t) .+ (1- d) / N, where matrix M:
M(i,j) = 1 / neighbours(pj), if j has link to i and else M(i,j) = 0.
Neighbours is the number of links from a page to another.

    Function DataInput reads from files and creates mat. Values are calculated
each step until an small enough desired error is reached. Array is initialised
with 1 / N to get an good enough first aproximation.


-------#### Algebraic ####-------

    Using R = d * M * R .+ (1-d)/N, which makes up the reccurence from above.
The result will look like  R = (I - d * M) ^ (-1) * (1 - d) / N * 1 ( 1 = column vector).

    GramSchmidt performs decomposition QR from a square matrix using optimised method.
BS function will calculate solution of a system of ecuations using backwards substitution.
It starts from the last line and going to the first.

    These two functions are combined in PR_Inv which calculates inverse of a matrix.
We perform decomposition QR with GramSchmidt and solve n systems with BS to obtain
columns of the inverse matrix.
    In Algebraic we make the matrix mat again with DataInput then calculate the
inverse of the matrix  I - d * M using PR_Inv and then creating R array.


-------#### Degree of affiliation ####--------

    Function Apartenenta makes value of function u in order for it to remain
continous on the entire interval. SortDesc has the purpose of sorting descendent
the nodes and PageRank indexes based on this grade.

    We are using a main script to call the PageRank function for each input.
PageRank calls Iterative and Algebraic to print the 2 arrays obtained in the
output. Array B contains values of the function described. 
