
targetScope = 'resourceGroup'

@description('Name of the virtual network')
param vnetName string = 'vnet-iac-dev'

@description('Azure region for the virtual network')
param location string = resourceGroup().location

@description('Virtual network address range')
param addressPrefix string = '10.10.0.0/16'

@description('Application subnet address range')
param appSubnetPrefix string = '10.10.1.0/24'

@description('Data subnet address range')
param dataSubnetPrefix string = '10.10.2.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'snet-app'
        properties: {
          addressPrefix: appSubnetPrefix
        }
      }
      {
        name: 'snet-data'
        properties: {
          addressPrefix: dataSubnetPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
output deployedVnetName string = vnet.name
output deployedLocation string = vnet.location
