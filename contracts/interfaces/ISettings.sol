// SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.6.12;

/**
 * @dev Interface of the Settings contract.
 */
interface ISettings {
    /**
    * @dev Event for tracking changed settings.
    * @param settingName - name of the changed setting.
    */
    event SettingChanged(bytes32 settingName);

    /**
    * @dev Event for tracking added/removed payment tokens.
    * @param token - address of updated payment token.
    */
    event PaymentTokenUpdated(address token);

    /**
    * @dev Constructor for initializing the Settings contract.
    * @param _maintainer - address of the maintainer, where the fee is paid.
    * @param _maintainerFee - percentage fee for using the service.
    * @param _minDepositUnit - minimum unit (wei, gwei, etc.) deposit can have.
    * @param _validatorDepositAmount - deposit amount required to become an Ethereum validator.
    * @param _maxDepositAmount - maximum deposit amount.
    * @param _validatorPrice - price per month of the non-custodial validator.
    * @param _allContractsPaused - defines whether all contracts should be paused.
    * @param _withdrawalCredentials - withdrawal credentials.
    * @param _admins - address of the Admins contract.
    * @param _operators - address of the Operators contract.
    */
    function initialize(
        address payable _maintainer,
        uint16 _maintainerFee,
        uint64 _minDepositUnit,
        uint128 _validatorDepositAmount,
        uint128 _maxDepositAmount,
        uint128 _validatorPrice,
        bool _allContractsPaused,
        bytes memory _withdrawalCredentials,
        address _admins,
        address _operators
    ) external;

    /**
    * @dev Function for getting maintainer address.
    */
    function maintainer() external view returns (address payable);

    /**
    * @dev Function for getting maintainer fee.
    */
    function maintainerFee() external view returns (uint64);

    /**
    * @dev Function for getting user deposit minimum unit.
    */
    function minDepositUnit() external view returns (uint64);

    /**
    * @dev Function for getting validator deposit amount.
    */
    function validatorDepositAmount() external view returns (uint128);

    /**
    * @dev Function for getting user maximum deposit amount.
    */
    function maxDepositAmount() external view returns (uint128);

    /**
    * @dev Function for getting non-custodial validator price.
    */
    function validatorPrice() external view returns (uint128);

    /**
    * @dev Function for getting withdrawal credentials.
    */
    function withdrawalCredentials() external view returns (bytes memory);

    /**
    * @dev Function for checking whether all the contracts are paused.
    */
    function allContractsPaused() external view returns (bool);

    /**
    * @dev Function for checking whether the contract is paused or not.
    * @param _contract - address of the contract to check.
    */
    function pausedContracts(address _contract) external view returns (bool);

    /**
    * @dev Function for checking whether payments with the token is supported or not.
    * @param _token - address of the token contract to check.
    */
    function supportedPaymentTokens(address _token) external view returns (bool);

    /**
    * @dev Function for changing user's deposit minimum unit.
    * @param newValue - new minimum deposit unit.
    */
    function setMinDepositUnit(uint64 newValue) external;

    /**
    * @dev Function for changing the maintainer's address.
    * @param newValue - new maintainer's address.
    */
    function setMaintainer(address payable newValue) external;

    /**
    * @dev Function for changing the maintainer's fee.
    * @param newValue - new maintainer's fee. Must be less than 10000 (100.00%).
    */
    function setMaintainerFee(uint64 newValue) external;

    /**
    * @dev Function for pausing or resuming managed contracts.
    * @param _contract - address of the managed contract.
    * @param _isPaused - defines whether contract is paused or not.
    */
    function setPausedContracts(address _contract, bool _isPaused) external;

    /**
    * @dev Function for enabling or disabling support for token payments.
    * @param _token - address of the token contract.
    * @param _isSupported - defines whether token is supported or not.
    */
    function setSupportedPaymentTokens(address _token, bool _isSupported) external;

    /**
    * @dev Function for pausing or resuming all managed contracts.
    * @param paused - defines whether all contracts must be paused or not.
    */
    function setAllContractsPaused(bool paused) external;

    /**
    * @dev Function for setting maximum deposit amount.
    * @param newValue - new maximum deposit amount.
    */
    function setMaxDepositAmount(uint128 newValue) external;

    /**
    * @dev Function for setting non-custodial validator price.
    * @param _validatorPrice - new validator price.
    */
    function setValidatorPrice(uint128 _validatorPrice) external;
}
