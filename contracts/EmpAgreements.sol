pragma solidity ^0.4.8;


contract EmpAgreements {
	EA[]  eAs;
	uint32 idCnt;
    
	address public employer;

	struct EA {
		uint32 id;
		string empArgName;
		
		string emplyrName;
		bool emplyrSigned;
		
		string emplyeName;
		address emplyeAdress;
		uint emplyeHWage;
		bool emplyeSigned;
	}



	function EmpAgreements() {
		idCnt = 0;
		employer = msg.sender;
	}


	function addEA(string _empArgName, string _emplyrName, string _emplyeName, uint _emplyeHWage, address _emplyeAdress) returns (bool success, uint32 id) {
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

		eAs.push(newEA);

		return (true, idCnt);
	}


    function getState(uint32 _id) returns (bool success, bool success2) {
        for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
			    return (eAs[i].emplyrSigned, eAs[i].emplyeSigned);
			}
        }
    }


	function signEA(uint32 _id) returns (bool success){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
			    
				if(msg.sender == employer && !eAs[i].emplyrSigned) {
					eAs[i].emplyrSigned = true;
					return (true);
				}
				
				if(msg.sender == eAs[i].emplyeAdress && !eAs[i].emplyeSigned) {
					eAs[i].emplyeSigned = true;
					return (true);
				}
			}
		}
		return (false);
	}


	function removeEA(uint32 _id) returns (bool success){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
				delete eAs[i];
				return (true);
			} 
		}
		return (false);
	}


	function getEAAttributes(uint32 _id) constant returns (string empArgName, string emplyrNames, string emplyeNames, uint emplyeHWage){
		for(uint i = 0; i < eAs.length; i++){
			if(eAs[i].id == _id) {
		        if(msg.sender == employer || msg.sender == eAs[i].emplyeAdress){
				    return (eAs[i].empArgName, eAs[i].emplyrName, eAs[i].emplyeName, eAs[i].emplyeHWage);
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
