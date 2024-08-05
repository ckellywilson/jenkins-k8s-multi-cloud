targetScope = 'resourceGroup'

param  location string
param  clusterName string
param adminUserName string
param keyData string
param nodeSize string
param tags object

resource aksCluster 'Microsoft.ContainerService/managedClusters@2024-03-02-preview' = {
  name: clusterName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.29.4'
    dnsPrefix: 'dnsprefix'
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 3
        vmSize: nodeSize
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: adminUserName
      ssh: {
        publicKeys: [
          {
            keyData: keyData
          }
        ]
      }
    }
  }
}

// Output
output aksName string = aksCluster.name
output aksResourceId string = aksCluster.id
