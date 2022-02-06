// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract Banktoken {

    // call it SilverBank
    string public name = "SilverBank";

    // create 2 state variables
    address public Silver;
    address public banktoken;

    address[]public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    // address 
    constructor() public {
       Silver = 0xC0a4C1Ef33C7C97Ed294f8092Ee09637885bC673;
       Banktoken = 0x524d6c245034c17EbdEd63E59990505B8004f753;

    }


// allow user to stake XYZ tokens in contract 

function stakeTokens(uint _amount) public {

    // Transfer XYZ tokens to contract for staking

    ERC20(Silver).transferFrom(msg.sender, address(this), _amount);

    // update the staking balance in map
    stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

    // Add users to stakers array if they haven't staked already
    if(!hasStaked[msg.sender]) {
        stakers.push(msg.sender);
    }

    // Update staking status to track
    isStaking[msg.sender] = true;
    hasStaked[msg.sender] = true;
}

    // allow users to unstake total balance and withdraw Silver from the contract 
    function unStakeTokens() public {

        // get the users staking balance in....
        uint balance = stakingBalance[msg.sender];

        // require the amount staked needs to be greater then 0
        require(balance > 0, "staking balance cannot be 0");

        // transfer Silver tokens out of this contract to the msg.sender
        ERC20(Silver).transfer(msg.sender, balance);

        // reset staking balance map to 0 
        stakingBalance[msg.sender] = 0;

        // update the staking status
        isStaking[msg.sender] = false;

    
    
    // Issue bank tokens as a reward for staking 

    function issueInterestToken() public {
        for (uint i=0; i<stakers.length; i++) {
            address receipient = stakers[i];
            uint balance = stakingBalance[recipient];


    
       }
    }
  }
}

  


   









