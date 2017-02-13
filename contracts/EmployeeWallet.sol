pragma solidity ^0.4.8;


contract EmployeeWallet {
	address public employee;
	address public employerAddress;
	string public name;
	bool public validContract;
	bool public access;
	uint32 public workHours;
	uint32 public balance;
	uint32 public hWage;
	bool public moneyOk;
	


	function EmployeeWallet(string _name) {
		employee = msg.sender;
		name = _name;
		access = false;
		workHours = 0;
		validContract = false;
		balance = 0;
		hWage = 0;
		moneyOk = false;
	}


	function resetWallet() {
		access = false;
		workHours = 0;
		validContract = false;
		balance = 0;
		hWage = 0;
		moneyOk = false;
	}


	function allowWorking(uint32 _workHours) {
		access = true;
		workHours = _workHours;
	}


	function () payable {

	}


	function sendMoney(uint32 amount){
		if(amount == workHours * hWage)
		{
			moneyOk;
			balance += amount;
		} 
	}


	function validContract(address _employerAddress, uint32 _hWage) {
		validContract = true;
		employerAddress = _employerAddress;
		hWage = _hWage;
	}
}
