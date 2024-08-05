// target scope
targetScope = 'subscription'

// parameters
param location string
param keyData string

// variables
var prefix = 'jenkins-multi'
var nodeSize = 'Standard_D2lds_v5'
var vmName = 'jenkins-vm'
var vmSize = nodeSize
var adminUsername = '${prefix}-admin'
var tags = {
  environment: prefix
}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${prefix}-rg'
  location: location
  tags: tags
}

module sshKey 'sshKey.bicep' = {
  scope: rg
  name: 'sshKey'
  params: {
    sshKeyName: '${prefix}-sshkey'
    location: location
    keyData: keyData
    tags: tags
  }
}

module aks 'aks.bicep' = {
  scope: rg
  name: 'aks'
  params: {
    location: location
    clusterName: '${prefix}-aks'
    adminUserName: adminUsername
    keyData: sshKey.outputs.sshKey
    nodeSize: nodeSize
    tags: tags
  }
}

module vm 'vm.bicep' = {
  name: vmName
  scope: rg
  params: {
    location: location
    networkInterfaceName1: '${prefix}-vm-nic'
    enableAcceleratedNetworking: true
    networkSecurityGroupName: '${prefix}-vm-nsg'
    networkSecurityGroupRules: [
      {
        name: 'SSH'
        properties: {
          priority: 300
          protocol: 'TCP'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
    subnetName: 'default'
    virtualNetworkName: '${prefix}-vnet'
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
    publicIpAddressName1: '${prefix}-ip'
    publicIpAddressType: 'Static'
    publicIpAddressSku: 'Standard'
    pipDeleteOption: 'Detach'
    virtualMachineName1: vmName
    virtualMachineComputerName1: vmName
    osDiskType: 'Premium_LRS'
    osDiskDeleteOption: 'Delete'
    virtualMachineSize: vmSize
    nicDeleteOption: 'Detach'
    adminUsername: adminUsername
    adminPublicKey: keyData
    patchMode: 'AutomaticByPlatform'
    rebootSetting: 'IfRequired'
    virtualMachine1Zone: '1'
    tags: tags
    dnsLabelPrefix: prefix
  }
}

output vmName string = vm.outputs.vmName
output adminUsername string = vm.outputs.adminUsername
output rgName string = rg.name
