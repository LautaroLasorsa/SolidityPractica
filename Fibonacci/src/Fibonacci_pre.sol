pragma solidity ^0.8.19;
// SPDX-License-Identifier: MIT

contract Fibonacci_pre {
    
    uint[2][2][257] private precomputed;

    function matrixProduct(uint[2][2] memory a, uint[2][2] memory b) private  pure returns(uint[2][2] memory c){
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

    constructor(){
        // Inicializando la matriz res
        precomputed[0][0][0] = 1;
        precomputed[0][0][1] = 0;
        precomputed[0][1][0] = 0;
        precomputed[0][1][1] = 1;

        // Inicializando la matriz base
        precomputed[1][0][0] = 0;
        precomputed[1][0][1] = 1;
        precomputed[1][1][0] = 1;
        precomputed[1][1][1] = 1;

        for(uint i = 2;i<257;i++){
            precomputed[i] = matrixProduct(precomputed[i-1], precomputed[i-1]);
        }
    }

    function GetFibonacci(uint n) public view returns(uint){
        uint[2][2] memory res;

        res[0][0] = 1;
        res[0][1] = 0;
        res[1][0] = 0;
        res[1][1] = 1;
        uint16 i = 1;
        while(n>0){
            if(n%2==1) res = matrixProduct(res,precomputed[i]);
            n = n/2;
            i++;
        }
        return res[0][1];
    }
}
