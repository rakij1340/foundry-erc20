// SPDX:License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    //      my_address -> 10 tokens
    mapping(address => uint256) private s_balanceOf;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //This needs to be 100 ether big, 100 ether = 100 * 10**18
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balanceOf[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = s_balanceOf[msg.sender] + s_balanceOf[_to];
        s_balanceOf[msg.sender] -= _amount;
        s_balanceOf[_to] += _amount;
        require(s_balanceOf[msg.sender] + s_balanceOf[_to] == previousBalances);
    }
}
