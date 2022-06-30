// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.4;

import "./interfaces/IRegistry.sol";

contract Registry is IRegistry {
  address public protocolFeeUnderlying;
  uint256 public storyRegisterFee;
  uint256 public storyAppendFee;
  uint256 public votingDuration;
  bytes32[] public allStories;
  mapping(bytes32 => uint256[]) internal profileIdRegistry;
  mapping(bytes32 => uint256[]) internal pubIdRegistry;
  mapping(bytes32 => mapping(uint256 => uint256[])) internal candidatesProfileIds;
  mapping(bytes32 => mapping(uint256 => uint256[])) internal candidatesPubIds;

  event storyRegistered(uint256 indexed profileId, uint256 pubId, bytes32 indexed _hash);
  event candidateRegistered(uint256 indexed headProfileId, uint256 headPubId, uint256 index, bytes32 indexed headHash, uint256 profileId, uint256 pubId);

  constructor(
    address _protocolFeeUnderlying,
    uint256 _storyRegisterFee,
    uint256 _storyAppendFee,
    uint256 _votingDuration
  ) {
    protocolFeeUnderlying = _protocolFeeUnderlying;
    storyRegisterFee = _storyRegisterFee;
    storyAppendFee = _storyAppendFee;
    votingDuration = _votingDuration;
  }

  function registerStory(StoryItem memory head) external override {
    bytes32 _hash = keccak256(abi.encodePacked(head.profileId, head.pubId));
    uint256[] memory newProfileIdHead = new uint256[](1);
    uint256[] memory newPubIdHead = new uint256[](1);
    newProfileIdHead[0] = head.profileId;
    newPubIdHead[0] = head.pubId;
    profileIdRegistry[_hash] = newProfileIdHead;
    pubIdRegistry[_hash] = newPubIdHead;
    allStories.push(_hash);
    emit storyRegistered(head.profileId, head.pubId, _hash);
  }

  function getStory(StoryItem memory head) external view override returns (StoryItem[] memory) {
    bytes32 _hash = keccak256(abi.encodePacked(head.profileId, head.pubId));
    uint256[] memory profileIds = profileIdRegistry[_hash];
    uint256[] memory pubIds = pubIdRegistry[_hash];
    StoryItem[] memory stories = new StoryItem[](profileIds.length);
    for (uint256 i = 0; i < profileIds.length; i++) {
      stories[i].profileId = profileIds[i];
      stories[i].pubId = pubIds[i];
    }
    return stories;
  }

  function getStoryByHash(bytes32 _hash) external view override returns (StoryItem[] memory) {
    uint256[] memory profileIds = profileIdRegistry[_hash];
    uint256[] memory pubIds = pubIdRegistry[_hash];
    StoryItem[] memory stories = new StoryItem[](profileIds.length);
    for (uint256 i = 0; i < profileIds.length; i++) {
      stories[i].profileId = profileIds[i];
      stories[i].pubId = pubIds[i];
    }
    return stories;
  }

  function appendStoryItemCandidate(
    StoryItem memory head,
    uint256 index,
    StoryItem memory candidate
  ) external override {
    bytes32 _hash = keccak256(abi.encodePacked(head.profileId, head.pubId));
    candidatesProfileIds[_hash][index].push(candidate.profileId);
    candidatesPubIds[_hash][index].push(candidate.pubId);
    emit candidateRegistered(head.profileId, head.pubId, index, _hash, candidate.profileId, candidate.pubId);
  }

  function listStoryItemCandidates(StoryItem memory head, uint256 index) external view override returns (StoryItem[] memory) {
    bytes32 _hash = keccak256(abi.encodePacked(head.profileId, head.pubId));
    uint256[] memory profileIds = candidatesProfileIds[_hash][index];
    uint256[] memory pubIds = candidatesPubIds[_hash][index];

    StoryItem[] memory candidates = new StoryItem[](profileIds.length);
    for (uint256 i = 0; i < profileIds.length; i++) {
      candidates[i].profileId = profileIds[i];
      candidates[i].pubId = pubIds[i];
    }

    return candidates;
  }

  function voteStoryItemCandidate(StoryItem memory head, StoryItem memory candidate) external override {}

  function getStoryItemCandidateVotes(StoryItem memory candidate) external view override returns (uint256 votes) {
    return 42;
  }


  function commitStory(StoryItem memory head) external override {}

  function getStoryVotingDeadline(StoryItem memory head) external view override returns (uint256) {
    return 42;
  }
}
