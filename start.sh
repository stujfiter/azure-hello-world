azure group create --name HelloWorld --location eastus
azure network vnet create --resource-group HelloWorld --name HelloWorld-vnet --location eastus
azure network vnet subnet create --resource-group HelloWorld --vnet-name HelloWorld-vnet --name HelloWorld-subnet --address-prefix '10.0.0.0/24'
azure network nic create --resource-group HelloWorld --name eve-nic --location eastus --subnet-name HelloWorld-subnet --subnet-vnet-name 'HelloWorld-vnet'
azure storage account create --sku-name LRS --location eastus --kind Storage --resource-group HelloWorld evestorage
azure vm create --resource-group HelloWorld --name Eve --location 'East US' --os-type Linux --image-urn UbuntuLTS --admin-username kearl --nic-name eve-nic --storage-account-name evestorage
