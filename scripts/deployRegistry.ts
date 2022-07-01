import { ethers, run } from "hardhat"

import chalk from "chalk"

async function main() {
  const signer = (await ethers.getSigners())[0]
  // console.log(`signer address: ${signer.address}`)
  // const RFactory = await ethers.getContractFactory("Registry")
  //
  // const registry = await RFactory.deploy(
  //   "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174",
  //   1,
  //   1,
  //   1
  // )
  // const registryAddress = registry.address
  // console.log(`Registry address ${registryAddress}`)

  await run("verify:verify", {
    address: "0x94847C28c7f36A162bc64f0Cf53DCC9aeb05B57d",
    constructorArguments: [
      "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174",
      1,
      1,
      1,
    ],
  }).catch((err) => console.warn(chalk.magenta(err.message)))
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
