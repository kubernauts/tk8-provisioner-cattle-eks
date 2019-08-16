package cluster

import (
	"log"

	"github.com/kubernauts/tk8/pkg/common"
	"github.com/spf13/viper"
)

type AwsCredentials struct {
	AwsAccessKeyID   string
	AwsSecretKey     string
	AwsAccessSSHKey  string
	AwsDefaultRegion string
}

type CattleEKSConfig struct {
	RancherClusterName string
	RancherApiUrl      string
	Region             string
	ExistingVpc        bool
	VpcId              string
	SubnetId1          string
	SubnetId2          string
	SubnetId3          string
	SecurityGroupName  string
	DiskSize           string
	AmiId              string
	MaximumNodes       int
	MinimumNodes       int
	KubernetesVersion  string
	SessionToken       string
	InstanceType       string
	AssociatePublicIp  bool
	ServiceRole        string
}

func GetCattleEKSConfig() CattleEKSConfig {
	ReadViperConfigFile("config")
	return CattleEKSConfig{
		RancherClusterName: viper.GetString("cattle-eks.rancher_cluster_name"),
		RancherApiUrl:      viper.GetString("cattle-eks.rancher_api_url"),
		Region:             viper.GetString("cattle-eks.region"),
		ExistingVpc:        viper.GetBool("cattle-eks.existing_vpc"),
		VpcId:              viper.GetString("cattle-eks.vpc_id"),
		SubnetId1:          viper.GetString("cattle-eks.subnets.subnet_id1"),
		SubnetId2:          viper.GetString("cattle-eks.subnets.subnet_id2"),
		SubnetId3:          viper.GetString("cattle-eks.subnets.subnet_id3"),
		SecurityGroupName:  viper.GetString("cattle-eks.security_group_name"),
		DiskSize:           viper.GetString("cattle-eks.disk_size"),
		AmiId:              viper.GetString("cattle-eks.ami_id"),
		MaximumNodes:       viper.GetInt("cattle-eks.maximum_nodes"),
		MinimumNodes:       viper.GetInt("cattle-eks.minimum_nodes"),
		KubernetesVersion:  viper.GetString("cattle-eks.kubernetes_version"),
		SessionToken:       viper.GetString("cattle-eks.session_token"),
		InstanceType:       viper.GetString("cattle-eks.instance_type"),
		AssociatePublicIp:  viper.GetBool("cattle-eks.associate_worker_node_public_ip"),
		ServiceRole:        viper.GetString("cattle-eks.service_role"),
	}
}

func SetClusterName() {
	if len(common.Name) < 1 {
		config := GetCattleEKSConfig()
		common.Name = config.RancherClusterName
	}
}

// ReadViperConfigFile is define the config paths and read the configuration file.
func ReadViperConfigFile(configName string) {
	viper.SetConfigName(configName)
	viper.AddConfigPath(".")
	viper.AddConfigPath("/tk8")
	verr := viper.ReadInConfig() // Find and read the config file.
	if verr != nil {             // Handle errors reading the config file.
		log.Fatalln(verr)
	}
}
