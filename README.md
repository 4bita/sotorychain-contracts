# Storychain contracts for Blockchain Professionals Hackathon

Crowd storytelling on blockchain.

## Deployed contracts
Registry: https://mumbai.polygonscan.com/address/0x96D6795721B6ffDa88169D031b9FD4Dc26e29578

LensHub Proxy: https://mumbai.polygonscan.com/address/0x60Ae865ee4C725cd04353b5AAb364553f56ceF82

Lens ProfileCreationProxy: https://polygonscan.com/address/0x1eeC6ecCaA4625da3Fa6Cd6339DBcc2418710E8a

## Deployment

1. `npx hardhat run scripts/deployRegistry.ts --network mumbai`

## Testing

1. `npm install`
2. `npx hardhat compile`
2. `npx hardhat test`

## Manual testing

1. Register Profile. 
2. Post publications.
3. Register story head.
4. Propose story continuation candidates.
5. Vote for candidates.
6. Commit winner!
7. goto step 4

