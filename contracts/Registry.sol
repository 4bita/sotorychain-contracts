// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.4;

import "./interfaces/IRegistry.sol";

contract Registry is IRegistry {
  address public protocolFeeUnderlying;
  uint256 public storyRegisterFee;
  uint256 public storyAppendFee;
  uint256 public votingDuration;

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

  function registerStory(StoryItem memory head) external override {}

  function getStory(StoryItem memory head) external view override returns (StoryItem[] memory) {
    StoryItem[] memory stories = new StoryItem[](0);
    return stories;
  }

  function appendStoryItemCandidate(
    StoryItem memory head,
    StoryItem memory tail,
    StoryItem memory candidate
  ) external override {}

  function voteStoryItemCandidate(StoryItem memory head, StoryItem memory candidate) external override {}

  function getStoryItemCandidateVotes(StoryItem memory candidate) external view override returns (uint256 votes) {
    return 42;
  }

  function listStoryItemCandidates(StoryItem memory head) external override returns (StoryItem[] memory) {
    StoryItem[] memory candidates = new StoryItem[](0);
    return candidates;
  }

  function commitStory(StoryItem memory head) external override {}

  function getStoryVotingDeadline(StoryItem memory head) external view override returns (uint256) {
    return 42;
  }
}
