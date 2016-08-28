azure network nsg rule delete --resource-group $1 --nsg-name $1-nsg --name $1InboundHttp-rule --quiet
azure network nsg rule delete --resource-group $1 --nsg-name $1-nsg --name $1InboundSSH-rule --quiet
azure vm delete --resource-group $1 --name Eve --quiet
azure storage account delete --resource-group $1 evestorage2 --quiet
azure network nic delete --resource-group $1 --name eve-nic --quiet
azure network public-ip delete --resource-group $1 --name evepublic --quiet
azure network nsg delete --resource-group $1 --name $1-nsg --quiet
azure network vnet subnet delete --resource-group $1 --vnet-name $1-vnet --name $1-subnet --quiet
azure network vnet delete --resource-group $1 --name $1-vnet --quiet
azure group delete --name $1 --quiet
