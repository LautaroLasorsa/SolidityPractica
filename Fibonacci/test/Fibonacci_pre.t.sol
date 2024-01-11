// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {Fibonacci_pre} from "../src/Fibonacci_pre.sol";

contract Fibonacci_preTest is Test {
    Fibonacci_pre public fibo;

    constructor(){
        fibo = new Fibonacci_pre();
    }

    function setUp() public {
    //    fibo = new Fibonacci_pre();
    }

    function test_0to10() public{
        uint[11] memory expected = [uint(0),1,1,2,3,5,8,13,21,34,55];
        for(uint8 i = 0;i<11;i++){
            assertEq(fibo.GetFibonacci(i), expected[i]);
        }
    }

    function test_300() public{
        assertEq(fibo.GetFibonacci(300), 222232244629420445529739893461909967206666939096499764990979600);
    }

    function test_2__256() public{
        assertEq(fibo.GetFibonacci(115792089237316195423570985008687907853269984665640564039457584007913129639935), 38354686833366335776136741289426639481662168524562440828010308269961806284514);
    }
}
