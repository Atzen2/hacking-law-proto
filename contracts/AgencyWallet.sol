pragma solidity ^0.4.8;

import "./EmployeeWallet.sol";


contract AgencyWallet {
	address agency;
	address employeeAddress;
	string public name;
	bool public validEAContract;
	bool public validPLAContract;
	uint32 public balance;
	uint32 public emplyeHWage;
	uint32 public emplyeHWage2;
	uint32 public workHours;
	


	function AgencyWallet(string _name) {
		agency = msg.sender;
		name = _name;
		validEAContract = false;
		validPLAContract = false;
		uint32 emplyeHWage = 0;
		uint32 emplyeHWage2 = 0;
		balance = 0;
		workHours = 0;
	}


	function resetWallet() {
		validEAContract = false;
		validPLAContract = false;
		balance = 0;
		emplyeHWage = 0;
		emplyeHWage2 = 0;
		workHours = 0;
	}



	function () payable {

	}


	function pipeMoney(){
		uint32 money1 = emplyeHWage * workHours;
		uint32 money2 = emplyeHWage2 * workHours;
		
		balance += money2 - money1;

		EmployeeWallet ew = EmployeeWallet(employeeAddress);
		ew.sendMoney(money1);
	}


	function validEAContract(uint32 _emplyeHWage, address _employeeAddress) {
		emplyeHWage = _emplyeHWage;
		validEAContract = true;
		employeeAddress = _employeeAddress;
	}

	function validPLAContract(uint32 _emplyeHWage2, uint32 _workHours) {
		validPLAContract = true;
		emplyeHWage2 = _emplyeHWage2;
		workHours = _workHours;
	}
}