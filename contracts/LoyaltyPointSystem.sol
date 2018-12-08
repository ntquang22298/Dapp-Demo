pragma solidity ^0.4.24;

contract LoyaltyPointSystem{
    
    
    struct Customer{
        string name;
        string email;
        uint phoneNumber;
        uint point;
    }
    
    mapping(address => Customer) customerList;
    
    function customerRegister(string _name, string _email, uint _phoneNumber )public{
        customerList[msg.sender]= Customer(_name,_email,_phoneNumber,0);
    }
    

    
    function getCustomerInformation(address customerAddress) external view returns(string name, string email, uint phoneNumber, uint point){
        Customer memory customer = customerList[customerAddress];
        name = customer.name;
        email = customer.email;
        phoneNumber = customer.phoneNumber;
        point = customer.point;
        
    }
    
    function earnPoint(uint amount)public {
        Customer storage customer = customerList[msg.sender];
        customer.point += amount;
    }
    
    function usePoint(uint amount)public {
        Customer storage customer = customerList[msg.sender];
        require(customer.point >= amount );
        customer.point= customer.point - amount;
    }
    
    function sendPoint( address receiverAddress,uint amount)public{

        Customer storage sender = customerList[msg.sender];
        Customer storage receiver = customerList[receiverAddress];
        require(sender.point >= amount);
        sender.point-=amount;
        receiver.point+=amount;
    }
    
    
    
    
}
    
    
    
    
    
