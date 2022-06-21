// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IKSFactory {
    function createPool(
        IERC20 tokenA,
        IERC20 tokenB,
        uint32 ampBps,
        uint24 feeUnits
    ) external returns (address pool);

    function setFeeConfiguration(address feeTo, uint24 governmentFeeUnits) external;

    function enableFeeOption(uint24 feeUnits) external;

    function disableFeeOption(uint24 feeUnits) external;

    function setFeeToSetter(address) external;

    function getFeeConfiguration()
        external
        view
        returns (address feeTo, uint24 governmentFeeUnits);

    function feeToSetter() external view returns (address);

    function allPools(uint256) external view returns (address pool);

    function allPoolsLength() external view returns (uint256);

    function getUnamplifiedPool(IERC20 token0, IERC20 token1) external view returns (address);

    function getPools(IERC20 token0, IERC20 token1)
        external
        view
        returns (address[] memory _tokenPools);

    function isPool(
        IERC20 token0,
        IERC20 token1,
        address pool
    ) external view returns (bool);
}
