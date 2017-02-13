pragma solidity ^0.4.8;

import "./EmployeeWallet.sol";
import "./AgencyWallet.sol";


contract EmpAgreements {
	EA[]  eAs;
	uint32 idCnt;
	bool plAAdressSet;
    
	address public employer;
	address public employerWallet;
	address public plAAdress;

	struct EA {
		uint32 id;
		string empArgName;
		
		string emplyrName;
		bool emplyrSigned;
		
		string emplyeName;
		address emplyeAdress;
		uint32 emplyeHWage;
		bool emplyeSigned;
		string attachment;
		address emplyeWalletAdress;
	}


	function () payable {

	}


	function EmpAgreements(address _employerWallet) {
		idCnt = 0;
		employer = msg.sender;
		employerWallet = _employerWallet;
		plAAdressSet = false;
	}


	function setPlAAdress(address _plAAddress) {
			plAAdress = _plAAddress;
			plAAdressSet == true;
	}


	function addEA(string _empArgName, string _emplyrName, string _emplyeName, uint32 _emplyeHWage, address _emplyeAdress, address _emplyeWalletAdress, string _attachment) returns (bool success, uint32 id) {
		if(msg.sender != employer|| msg.sender == _emplyeAdress) return (false, 0);


		EA memory newEA;
		
		idCnt++;

		newEA.id = idCnt;

		newEA.empArgName = _empArgName;

		newEA.emplyrSigned = false;
		newEA.emplyrName = _emplyrName;

		newEA.emplyeSigned = false;
		newEA.emplyeName = _emplyeName;
		newEA.emplyeAdress = _emplyeAdress;
		newEA.emplyeHWage = _emplyeHWage;
		newEA.attachment = _attachment;
		newEA.emplyeWalletAdress = _emplyeWalletAdress;

		eAs.push(newEA);

		return (true, idCnt);
	}


	function signEA(uint32 _id){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
			    
				if(msg.sender == employer && !eAs[i].emplyrSigned) {
					eAs[i].emplyrSigned = true;
				}
				
				if(msg.sender == eAs[i].emplyeAdress && !eAs[i].emplyeSigned) {
					eAs[i].emplyeSigned = true;
				}

				if(eAs[i].emplyrSigned && eAs[i].emplyeSigned){
					
					EmployeeWallet ew = EmployeeWallet(eAs[i].emplyeWalletAdress);
					ew.validContract( employer, eAs[i].emplyeHWage);

					AgencyWallet aw = AgencyWallet(employerWallet);
					aw.validEAContract(eAs[i].emplyeHWage, eAs[i].emplyeWalletAdress);
				}
			}
		}
	}


	function removeEA(uint32 _id) returns (bool success){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id && msg.sender == employer) {
				delete eAs[i];
				return (true);
			} 
		}
		return (false);
	}


	function getEAAttributes(uint32 _id) constant returns (string empArgName, string emplyrNames, string emplyeNames, uint emplyeHWage, string attachment){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
		        if(msg.sender == employer || msg.sender == eAs[i].emplyeAdress){
				    return (eAs[i].empArgName, eAs[i].emplyrName, eAs[i].emplyeName, eAs[i].emplyeHWage, eAs[i].attachment);
		        }
			} 
		}
	}


	function isEASigned(uint32 _id) constant returns (bool signed) {
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id && eAs[i].emplyeSigned && eAs[i].emplyrSigned) {
				return (true);
			}
		}
		return (false);
	}
}