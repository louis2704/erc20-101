pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{
    constructor(address evaluator1) public ERC20("Louiscoin", "jdgpE"){
        _mint(msg.sender,853175455000000000000000000);
    }
    mapping(address => bool) public isAllowed;
    mapping(address => uint) public isLevel;
    function symbol() public override(ERC20, IExerciceSolution) view returns (string memory){
        return "jdgpE";
    }
    function getToken() external override returns (bool){
        require(isAllowed[msg.sender] == true);
        _mint(msg.sender,1);
        return true;
    }
    function buyToken() external payable override returns (bool){
        require(isAllowed[msg.sender] == true);
        if (isLevel[msg.sender] == 1){
            _mint(msg.sender, msg.value);
        }
        if (isLevel[msg.sender] == 2){
            _mint(msg.sender, msg.value*2);
        }
        else{
            _mint(msg.sender, 1);
        }
        return true;
    }
    function isCustomerWhiteListed(address customerAddress) external override returns (bool){
        isAllowed[customerAddress]=true;
        return true;
    }
    function customerTierLevel(address customerAddress) external override returns (uint256){
        isLevel[customerAddress] = 2;
        return 2;
    }
}