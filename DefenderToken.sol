pragma solidity ^0.4.8;
import './ERC20.sol';

contract DefenderToken is ERC20{

    function DefenderToken(address _tokenManager, address _escrow) {
        tokenManager = _tokenManager;
        escrow = _escrow;
    }

    /*/
     *  Constants
    /*/

    string public constant name = "Defenders Token";
    string public constant symbol = "DET";
    uint   public constant decimals = 18;

    uint public constant PRICE = 1000;

    uint public constant TOKEN_SUPPLY_LIMIT = 606 * 10000 * (1 ether / 1 wei);



    /*/
     *  Token state
    /*/

    enum Phase {
        Created,
        Running,
        Paused,
        Finished
    }

    Phase public currentPhase = Phase.Created;
    uint public totalSupply = 0; // amount of tokens already sold

    address public tokenManager;
    address public escrow;
    address public crowdsaleManager;

    mapping (address => uint256) private balance;


    modifier onlyTokenManager()     { if(msg.sender != tokenManager) throw; _; }
    modifier onlyCrowdsaleManager() { if(msg.sender != crowdsaleManager) throw; _; }


    /*/
     *  Events
    /*/

    event LogBuy(address indexed owner, uint value);
    event LogBurn(address indexed owner, uint value);


    /*/
     *  Public functions
    /*/

    function() payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address _buyer) public payable {
    }

    function burnTokens(address _owner) public
        onlyCrowdsaleManager
    {
    }

    function balanceOf(address _owner) constant returns (uint256) {
        return balance[_owner];
    }


    /*/
     *  Administrative functions
    /*/

    function withdrawEther() public
        onlyTokenManager
    {
    }


    function setCrowdsaleManager(address _mgr) public
        onlyTokenManager
    {
    }
}
