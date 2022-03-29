 ### important: private
 ```
 SELECTOR = "wrappedTransfer(address,uint256)"  [-> address to, uint value]
 ```
 ```
 data.length == 0  ->[not good impelentation erc20 token like bnb&usdt eth mainnet contracts]
 ```
 ```
 abi.decode(data, (bool))  -> [currect erc20 impelentation]
 ```
 wrappedTransact  -> is an example, need IERCxxx for work trough this example
 
 ---
 
 - return bool from success condition at the end
 - make conditions at the begining
 - impelementation by trought Interface
