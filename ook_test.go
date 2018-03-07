package envconfig

import (
	"github.com/kelseyhightower/envconfig"
	"testing"
)

type Spec struct {
	Koo string
}

func TestMain(t *testing.T) {
	var s Spec
	err := envconfig.Process("ook", &s)
	if err != nil {
		t.Fatal(err.Error())
	}

	if s.Koo != "OK" {
		t.Errorf("Not OK: %+v", s)
	}
}
