// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.4;

interface IRegistry {
  struct StoryItem {
    uint256 profileId;
    uint256 pubId;
  }

  function registerStory(StoryItem memory head) external;

  function getStory(StoryItem memory head) external view returns (StoryItem[] memory);

  function appendStoryItemCandidate(
    StoryItem memory head,
    StoryItem memory tail,
    StoryItem memory candidate
  ) external;

  function voteStoryItemCandidate(StoryItem memory head, StoryItem memory candidate) external;

  function getStoryItemCandidateVotes(StoryItem memory candidate) external view returns (uint256 votes);

  function listStoryItemCandidates(StoryItem memory head) external returns (StoryItem[] memory);

  function commitStory(StoryItem memory head) external;

  function getStoryVotingDeadline(StoryItem memory head) external view returns (uint256);
}
