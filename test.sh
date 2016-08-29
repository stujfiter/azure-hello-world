#! /bin/bash
./start.sh HelloWorld eve
./provision.sh eve
sleep 30
ACT=$(curl --max-time 30 http://eve-kearl.eastus.cloudapp.azure.com/hello)
if [[ $ACT == "Hello, World!" ]]; then
	RESULT="TEST PASSED!"
else
	RESULT="TEST FAILED!"
fi

./stop.sh HelloWorld eve
echo $RESULT
