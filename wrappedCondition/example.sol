// SPDX-License_identifier: MIT
pragma solidity 0.8;

contract WrappingConditions {
    // important: private
    // SELECTOR = "wrappedTransfer(address,uint256)"  [-> address to, uint value]
    // data.length == 0  ->[not good impelentation erc20 token like bnb&usdt eth mainnet contracts]
    // abi.decode(data, (bool))  -> [currect erc20 impelentation]
    // wrappedTransact  -> is an example, need IERCxxx for work trough this example
    
    function wrappedTransact(address token, address to, uint value) private {
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(SELECTOR, to, value)
        );
        require(success && (data.length == 0 || abi.decode(data, (bool))),
            "Transaction failed");
    }

    // ------------------------------------------
    // bad wrapp coding
    // sometimes developer doing this type, but dont have 3 importants for doing the job
    function notWrappedTransact(address token, address to, uint value) private {
        uint256 amount = value;
        uint256 balance = token.balanceOf(msg.sender);
        if (balance < amount) {
            throw;
        }
        token.transfer(to, amount);
    }
}

// how to find SELECTOR -> like: "transfer(address,uint256)"
contract FindSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}
