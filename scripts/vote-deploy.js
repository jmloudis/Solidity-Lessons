async function main() {

    const Voter = await ethers.getContractFactory('Vote');
    const [deployer] = await ethers.getSigners();
    console.log('Deploying contracts with the account:', deployer.address);
    console.log('Account balance:', (await deployer.getBalance()).toString());
    const voter = await Voter.deploy([
     '0x696d70726f76652d64656d6f6372616379000000000000000000000000000000',
     '0x6b6565702d64656d6f6372616379000000000000000000000000000000000000',
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