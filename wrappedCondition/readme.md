 ### important: private signature
 
 ```
 SELECTOR = "wrappedTransfer(address,uint256)"  -> [address to, uint value]
 ```
 ```
 data.length == 0  -> [for found bad impelements like bnb & usdt on eth mainnet contracts]
 ```
 ```
 abi.decode(data, (bool))  -> [currect ercxxx impelentation]
 ```
 
 wrappedTransact  -> is an example, need IERCxxx for work trough this example
 
 ---
 
 - return bool from success condition at the end
 - make conditions at the begining
 - impelementation by trought Interface

##

### example from: @ t4sk
```
contract MultiDelegatecall {
    error DelegatecallFailed();

    function multiDelegatecall(bytes[] memory data)
        external
        payable
        returns (bytes[] memory results)
    {
        results = new bytes[](data.length);

        for (uint i; i < data.length; i++) {
            (bool ok, bytes memory res) = address(this).delegatecall(data[i]);
            if (!ok) {
                revert DelegatecallFailed();
            }
            results[i] = res;
        }
    }
}
contract Test is MultiDelegatecall {
    event Log(address caller, string func, uint i);

    function func1(uint x, uint y) external {
        emit Log(msg.sender, "func1", x + y);
    }

    function func2() external returns (uint) {
        emit Log(msg.sender, "func2", 2);
        return 111;
    }
 }
contract Helper {
    function getFunc1Data(uint x, uint y) external pure returns (bytes memory) {
        return abi.encodeWithSelector(Test.func1.selector, x, y);
    }

    function getFunc2Data() external pure returns (bytes memory) {
        return abi.encodeWithSelector(Test.func2.selector);
    }
}
```

##

<p align="right"> 
  <a href="https://github.com/mosi-sol/audit" target="blank">
  <img src="https://img.shields.io/badge/Ver-2022-blue?style=flat" alt="cafe_pafe" /></a>
  <a href="https://github.com/mosi-sol/audit" target="blank">
  <img src="https://img.shields.io/badge/License-MIT-lightblue?style=flat" alt="cafe_pafe" /></a>
</p>
