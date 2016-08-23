azure network nsg rule delete --resource-group HelloWorld --nsg-name HelloWorld-nsg --name HelloWorldInboundHttp-rule --quiet
azure network nsg rule delete --resource-group HelloWorld --nsg-name HelloWorld-nsg --name HelloWorldInboundSSH-rule --quiet
azure vm delete --resource-group HelloWorld --name Eve --quiet
azure storage account delete --resource-group HelloWorld evestorage2 --quiet
azure network nic delete --resource-group HelloWorld --name eve-nic --quiet
azure network public-ip delete --resource-group HelloWorld --name evepublic --quiet
azure network nsg delete --resource-group HelloWorld --name HelloWorld-nsg --quiet
azure network vnet subnet delete --resource-group HelloWorld --vnet-name HelloWorld-vnet --name HelloWorld-subnet --quiet
azure network vnet delete --resource-group HelloWorld --name HelloWorld-vnet --quiet
azure group delete --name HelloWorld --quiet
