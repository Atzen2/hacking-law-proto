This is a simple example of creating and using a smart Contract.

You can create a smart contract, view it's public test variable and toggle it.

Requirements:
testrpc must be running



Contract code:

pragma solidity ^0.4.8;

contract MyContract {
    bool public testVar;

    /* Constructor */
    function MyContract() {
        testVar = false;
    }
    
    function toggleTestVar(){
        testVar = !testVar;
    }
}