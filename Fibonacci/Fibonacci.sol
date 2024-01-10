// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Fibonacci {

    function MatrixProduct(uint[2][2] memory a, uint[2][2] memory b) private  pure returns(uint[2][2] memory c){
        //uint[2][2] memory c;
        for(uint8  i = 0;i<2;i++)
            for(uint8  j =0 ;j<2;j++ )
                for(uint8  k = 0;k<2;k++)
                {
                    unchecked {
                        c[i][j] = c[i][j] + a[i][k]*b[k][j];
                    }
                }
        return c;    
    }

    function getFibonacci(uint n) public pure returns(uint){
        uint[2][2] memory res;
        uint[2][2] memory base;
        // Inicializando la matriz res
        res[0][0] = 1;
        res[0][1] = 0;
        res[1][0] = 0;
        res[1][1] = 1;

        // Inicializando la matriz base
        base[0][0] = 0;
        base[0][1] = 1;
        base[1][0] = 1;
        base[1][1] = 1;

        while(n>0){
            if(n%2==1) res = MatrixProduct(res,base);
            base = MatrixProduct(base, base);
            n = n/2;
        }
        return res[0][1];
    }
}
