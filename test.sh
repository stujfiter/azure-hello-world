#! /bin/bash
ACT=$(curl --silent --max-time 5 http://$1-kearl.eastus.cloudapp.azure.com/hello)
if [[ $ACT == "Hello, World!" ]]; then
	echo "TEST PASSED!"
else
	echo "TEST FAILED!"
fi
