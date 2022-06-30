import chai from 'chai'
import chaiAsPromised from 'chai-as-promised'
import { solidity } from 'ethereum-waffle'
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers'
import { ethers } from 'hardhat'
import { Hello } from "../typechain"

const { expect } = chai
chai.use(chaiAsPromised)
chai.use(solidity)

describe('Smoke tests', function () {
  let deployer: SignerWithAddress
  let hello: Hello

  beforeEach(async function () {
    ;[deployer,] = await ethers.getSigners()
     console.log(`deployer: ${deployer.address}`)
     const HelloFact = await ethers.getContractFactory("Hello")
     hello = await HelloFact.deploy()

  })

  describe('General tests', function () {
    it('Smoke test', async function () {
        expect(await hello.hello()).is.eq("Hello")
    })

  })
})
