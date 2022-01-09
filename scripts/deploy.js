const hre = require("hardhat");

async function main() {
  
  // Greeter.sol contract
  const Greeter = await hre.ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hello, Hardhat!");
  await greeter.deployed();
  console.log("Greeter deployed to:", greeter.address);

  // Token.sol contract
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  // Vote.sol contract

  const Voter = await ethers.getContractFactory('Vote');
  const [deployer] = await ethers.getSigners();
  const voter = await Voter.deploy([
    '0x6769616e74000000000000000000000000000000000000000000000000000000',
    '0x6769616e745f646f756368650000000000000000000000000000000000000000',
    '0x676f6f642d6469746163746f7200000000000000000000000000000000000000',
    '0x616e617263687900000000000000000000000000000000000000000000000000',
  ]);
  console.log('Voter address:', voter.address);


}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
