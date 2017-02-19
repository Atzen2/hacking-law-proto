This is a simple example of creating and using a smart Contract.

You can create a smart contract, view it's public test variable and toggle it.

Requirements:
run testrpc (https://github.com/ethereumjs/testrpc)
	$ testrpc 

run meteor (https://www.meteor.com/install)
	$ meteor




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