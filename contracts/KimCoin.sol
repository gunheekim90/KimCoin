pragma solidity ^0.4.17;

contract KimCoin {
     
    mapping (address => uint256) public balances;// This creates an array with all balances
    string public name;
    string public symbol;
    uint8 public decimals;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function KimCoin(
        uint256 initialSupply
        ) {
        balances[msg.sender] = initialSupply;              // Give the creator all initial tokens
        name = "KimCoin";
        symbol = "GH";
        decimals = 2;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balances[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balances[_to] + _value < balances[_to]) throw; // Check for overflows
        balances[msg.sender] -= _value;                     // Subtract from the sender
        balances[_to] += _value;                            // Add the same to the recipient
    }

    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

    function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}