 ### important: private signature
 ```
 SELECTOR = "wrappedTransfer(address,uint256)"  -> [address to, uint value]
 ```
 ```
 data.length == 0  ->[not good impelentation ercxxx token like bnb&usdt eth mainnet contracts]
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

<p align="right"> 
  <a href="https://github.com/mosi-sol/audit" target="blank">
  <img src="https://img.shields.io/badge/Ver-2022-blue?style=flat" alt="cafe_pafe" /></a>
  <a href="https://github.com/mosi-sol/audit" target="blank">
  <img src="https://img.shields.io/badge/License-MIT-lightblue?style=flat" alt="cafe_pafe" /></a>
</p>
