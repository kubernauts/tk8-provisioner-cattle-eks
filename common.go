package provisioner

import (
	"fmt"
	"log"
	"os/exec"
	"os/user"
	"strings"

	"github.com/blang/semver"
	"github.com/kubernauts/tk8-provisioner-cattle-eks/internal/cluster"
	"github.com/kubernauts/tk8/pkg/provisioner"
)

type CATTLEEKS struct {
}

// var Name string

func (p CATTLEEKS) Init(args []string) {
	// Name = cluster.Name
	// if len(Name) == 0 {
	// 	Name = "TK8RKE"
	// }
	// cluster.KubesprayInit()
	// cluster.Create()
}

func (p CATTLEEKS) Setup(args []string) {
	kube, err := exec.LookPath("kubectl")
	if err != nil {
		log.Fatal("kubectl not found, kindly check")
	}
	fmt.Printf("Found kubectl at %s\n", kube)
	rr, err := exec.Command("kubectl", "version", "--client", "--short").Output()
	if err != nil {
		log.Fatal(err)
	}

	log.Println(string(rr))
	_, err = user.Current()
	if err != nil {
		log.Fatal(err)
	}

	//Check if kubectl version is greater or equal to 1.10

	parts := strings.Split(string(rr), " ")

	KubeCtlVer := strings.Replace((parts[2]), "v", "", -1)

	v1, err := semver.Make("1.10.0")
	v2, err := semver.Make(strings.TrimSpace(KubeCtlVer))

	if v2.LT(v1) {
		log.Fatalln("kubectl client version on this system is less than the required version 1.10.0")
	}

	if _, err := exec.LookPath("terraform"); err != nil {
		log.Fatalln("Terraform binary not found in the installation folder")
	}

	log.Println("Terraform binary exists in the installation folder, terraform version:")

	terr, err := exec.Command("terraform", "version").Output()
	if err != nil {
		log.Fatal(err)
	}
	log.Println(string(terr))

	cluster.Install()

}

func (p CATTLEEKS) Scale(args []string) {
	provisioner.NotImplemented()

}

func (p CATTLEEKS) Reset(args []string) {
	cluster.Reset()

}

func (p CATTLEEKS) Remove(args []string) {
	// remove cattle-eks cluster, not complete infra
	// equivalent to cattle-eks remove --config rancher-cluster.yml
	provisioner.NotImplemented()

}

func (p CATTLEEKS) Upgrade(args []string) {
	cluster.Upgrade()

}

func (p CATTLEEKS) Destroy(args []string) {
	// teardown complete infra
	cluster.CattleEKSDestroy()
}

func NewCattleEKS() provisioner.Provisioner {
	cluster.SetClusterName()
	provisioner := new(CATTLEEKS)
	return provisioner
}
