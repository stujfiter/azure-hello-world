azure group create --name HelloWorld --location eastus
azure network vnet create --resource-group HelloWorld --name HelloWorld-vnet --location eastus
azure network vnet subnet create --resource-group HelloWorld --vnet-name HelloWorld-vnet --name HelloWorld-subnet --address-prefix '10.0.0.0/24'
azure network nsg create --resource-group HelloWorld --location eastus --name HelloWorld-nsg
azure network public-ip create --location eastus --resource-group HelloWorld --domain-name-label eve-kearl --name evepublic
azure network nic create --resource-group HelloWorld --name eve-nic --location eastus --subnet-name HelloWorld-subnet --subnet-vnet-name 'HelloWorld-vnet' --public-ip-name evepublic --network-security-group-name HelloWorld-nsg
azure storage account create --sku-name LRS --location eastus --kind Storage --resource-group HelloWorld evestorage2
azure vm create --resource-group HelloWorld --name Eve --location 'East US' --os-type Linux --image-urn UbuntuLTS --admin-username kearl --nic-name eve-nic --storage-account-name evestorage2
azure network nsg rule create --resource-group HelloWorld --nsg-name HelloWorld-nsg --name HelloWorldInboundSSH-rule --priority 4096 --destination-port-range 22 --protocol '*' --source-port-range '*' --source-address-prefix '*' --destination-address-prefix '*' --access Allow --direction Inbound
azure network nsg rule create --resource-group HelloWorld --nsg-name HelloWorld-nsg --name HelloWorldInboundHttp-rule --priority 4095 --destination-port-range 80 --protocol '*' --source-port-range '*' --source-address-prefix '*' --destination-address-prefix '*' --access Allow --direction Inbound
