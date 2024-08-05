using 'vm.bicep'

param location = 'eastus'
param networkInterfaceName1 = 'jenkins-vm459_z1'
param enableAcceleratedNetworking = true
param networkSecurityGroupName = 'jenkins-vm-nsg'
param networkSecurityGroupRules = [
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

param subnetName = 'default'
param virtualNetworkName = 'jenkins-vm-vnet'
param addressPrefixes = [
  '10.0.0.0/16'
]

param subnets = [
  {
    name: 'default'
    properties: {
      addressPrefix: '10.0.0.0/24'
    }
  }
]

param publicIpAddressName1 = 'jenkins-vm-ip'
param publicIpAddressType = 'Static'
param publicIpAddressSku = 'Standard'
param pipDeleteOption = 'Detach'
param virtualMachineName1 = 'jenkins-vm'
param virtualMachineComputerName1 = 'jenkins-vm'
param osDiskType = 'Premium_LRS'
param osDiskDeleteOption = 'Delete'
param virtualMachineSize = 'Standard_D2s_v3'
param nicDeleteOption = 'Detach'
param adminUsername = 'azureuser'
param adminPublicKey = ''
param patchMode = 'AutomaticByPlatform'
param rebootSetting = 'IfRequired'
param virtualMachine1Zone = '1'
