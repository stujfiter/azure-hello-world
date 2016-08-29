azure group create --name $1 --location eastus
azure network vnet create --resource-group $1 --name $1-vnet --location eastus
azure network vnet subnet create --resource-group $1 --vnet-name $1-vnet --name $1-subnet --address-prefix '10.0.0.0/24'
azure network nsg create --resource-group $1 --location eastus --name $1-nsg
azure network public-ip create --location eastus --resource-group $1 --domain-name-label $2-kearl --name $2public
azure network nic create --resource-group $1 --name $2-nic --location eastus --subnet-name $1-subnet --subnet-vnet-name $1-vnet --public-ip-name $2public --network-security-group-name $1-nsg
azure storage account create --sku-name LRS --location eastus --kind Storage --resource-group $1 $2storage2
azure vm create --resource-group $1 --name $2 --location 'East US' --os-type Linux --image-urn UbuntuLTS --admin-username kearl --nic-name $2-nic --storage-account-name $2storage2
azure network nsg rule create --resource-group $1 --nsg-name $1-nsg --name $1InboundSSH-rule --priority 4096 --destination-port-range 22 --protocol '*' --source-port-range '*' --source-address-prefix '*' --destination-address-prefix '*' --access Allow --direction Inbound
azure network nsg rule create --resource-group $1 --nsg-name $1-nsg --name $1InboundHttp-rule --priority 4095 --destination-port-range 80 --protocol '*' --source-port-range '*' --source-address-prefix '*' --destination-address-prefix '*' --access Allow --direction Inbound
