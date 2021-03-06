pragma solidity ^0.4.15;


contract TestToken {
    mapping (address => uint) public balances;
    address blacklisted;

    function TestToken(address _blacklisted) payable {
        blacklisted = _blacklisted;
        balances[msg.sender] = 1000;
    }

    function transfer(address _to, uint _value) returns (bool success) {
        if (_to == blacklisted) {
            return false;
        }

        if (balances[msg.sender] >= _value) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            return true;
        }
        return false;
    }

    function balanceOf(address _owner) constant returns (uint balance) {
        return balances[_owner];
    }
}