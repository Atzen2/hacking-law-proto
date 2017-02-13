pragma solidity ^0.4.8;

import "./AgencyWallet.sol";


contract ManufactorWallet {
	address manufactor;
	address agencyAddress;
	string public name;
	bool public validContract;
	uint32 public balance;
	uint32 public emplyeHWage;
	uint32 public workHours;
	uint32 public maxHour;	


	function ManufactorWallet(string _name) {
		manufactor = msg.sender;
		name = _name;
		validContract = false;
		uint32 emplyeHWage = 0;
		balance = 0;
		workHours = 0;
		maxHour = 0;
	}


	function resetWallet() {
		validContract = false;
		uint32 emplyeHWage = 0;
		balance = 0;
		workHours = 0;
		maxHour = 0;
	}


	function updateHours() {
		if(validContract){
			maxHour++;

			if(maxHour >= workHours) {
				balance -= workHours * emplyeHWage; 
				
				AgencyWallet aw = AgencyWallet(agencyAddress);
				aw.pipeMoney();

				validContract = false;
			}
		} 
	}



	function () payable {

	}


	function validContract(uint32 _emplyeHWage, uint32 _workHours, address _agencyAddress) {
		validContract = true;
		emplyeHWage = _emplyeHWage;
		workHours = _workHours;
		agencyAddress = _agencyAddress;
	}
}