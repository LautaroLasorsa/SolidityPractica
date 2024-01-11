

build-solidity:
	go run main.go

build-abi: 
#	test/src/Verifier.sol
#	cd test/ && forge build -C src/Verifier.sol -o ../abi
	forge build -C Fibonacci.sol -o abi
	jq '.abi' ./abi/Verifier.sol/PlonkVerifier.json > ./abi/Verifier.json
#	rm -rf ./abi/Verifier.sol

all:
	make build-solidity
	make build-abi

test-solidity:
	go test 
	forge test --root test/ -v

test-all:
	make all
	make test-solidity