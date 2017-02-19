import { Template } from 'meteor/templating';
import { ReactiveVar } from 'meteor/reactive-var';

import './main.html';


var mycontractContract = {};
var mycontract = {};

var pageSession = new ReactiveDict();

Template.toggleVar.onCreated(function toggleVarOnCreated() {

});

Template.toggleVar.helpers({
    "testVar": function() {
        return pageSession.get('testVar');
    },
});

Template.toggleVar.events({
    'click #createButton': function(event, instance) {

        mycontractContract = web3.eth.contract([{ "constant": true, "inputs": [], "name": "testVar", "outputs": [{ "name": "", "type": "bool" }], "payable": false, "type": "function" }, { "constant": false, "inputs": [], "name": "toggleTestVar", "outputs": [], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" }]);
        mycontract = mycontractContract.new({
            from: web3.eth.accounts[0],
            data: '0x6060604052341561000c57fe5b5b6000600060006101000a81548160ff0219169083151502179055505b5b60e6806100386000396000f30060606040526000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680639c328fb3146044578063bce228c014606b575bfe5b3415604b57fe5b6051607a565b604051808215151515815260200191505060405180910390f35b3415607257fe5b6078608d565b005b600060009054906101000a900460ff1681565b600060009054906101000a900460ff1615600060006101000a81548160ff0219169083151502179055505b5600a165627a7a72305820e517ef67147b60b3cede3dd95825e66c4d17838e3dd09be65c24da4dab523e4c0029',
            gas: '4700000'
        }, function(e, contract) {
            console.log(e, contract);
            if (typeof contract.address !== 'undefined') {
                console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
                pageSession.set('testVar', contract.testVar().toString());
            }
        })

    },
    'click #toggleButton': function(event, instance) {
        var transactionHash = mycontract.toggleTestVar({ from: web3.eth.accounts[0] });
        console.log('mycontract.toggleTestVar() triggered. TransactionHash: ' + transactionHash);
        pageSession.set('testVar', mycontract.testVar().toString());
    },
});
