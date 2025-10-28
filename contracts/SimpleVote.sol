// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVote {
    address public owner; bool public open;
    mapping(address=>bool) public voted; uint256 public yes; uint256 public no;
    constructor(){owner=msg.sender;}
    function start(bool _open) external {require(msg.sender==owner); open=_open;}
    function vote(bool _yes) external {require(open,"closed"); require(!voted[msg.sender],"once");
        voted[msg.sender]=true; _yes? yes++ : no++;
    }
}
