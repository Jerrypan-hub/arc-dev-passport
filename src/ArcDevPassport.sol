// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @title ArcDevPassport
/// @notice A tiny public developer-profile and contribution log for Arc Testnet builders.
/// @dev This is intentionally simple: no token, no promise of rewards, just an onchain activity record.
contract ArcDevPassport {
    struct Profile {
        string handle;
        string projectUrl;
        uint256 createdAt;
        uint256 updatedAt;
        uint256 contributionCount;
    }

    struct Contribution {
        string category;
        string uri;
        uint256 timestamp;
    }

    mapping(address => Profile) private profiles;
    mapping(address => Contribution[]) private contributions;

    event DeveloperRegistered(address indexed developer, string handle, string projectUrl);
    event ProfileUpdated(address indexed developer, string handle, string projectUrl);
    event ContributionLogged(address indexed developer, string category, string uri, uint256 timestamp);

    error EmptyHandle();
    error EmptyURI();
    error NotRegistered();

    function registerDeveloper(string calldata handle, string calldata projectUrl) external {
        if (bytes(handle).length == 0) revert EmptyHandle();

        Profile storage profile = profiles[msg.sender];
        uint256 nowTs = block.timestamp;

        if (profile.createdAt == 0) {
            profile.createdAt = nowTs;
            emit DeveloperRegistered(msg.sender, handle, projectUrl);
        } else {
            emit ProfileUpdated(msg.sender, handle, projectUrl);
        }

        profile.handle = handle;
        profile.projectUrl = projectUrl;
        profile.updatedAt = nowTs;
    }

    function logContribution(string calldata category, string calldata uri) external {
        Profile storage profile = profiles[msg.sender];
        if (profile.createdAt == 0) revert NotRegistered();
        if (bytes(uri).length == 0) revert EmptyURI();

        Contribution memory contribution = Contribution({
            category: category,
            uri: uri,
            timestamp: block.timestamp
        });

        contributions[msg.sender].push(contribution);
        profile.contributionCount += 1;
        profile.updatedAt = block.timestamp;

        emit ContributionLogged(msg.sender, category, uri, block.timestamp);
    }

    function getProfile(address developer) external view returns (Profile memory) {
        return profiles[developer];
    }

    function getContribution(address developer, uint256 index) external view returns (Contribution memory) {
        return contributions[developer][index];
    }

    function getContributionCount(address developer) external view returns (uint256) {
        return contributions[developer].length;
    }
}
