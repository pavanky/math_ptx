SRC=$(shell (ls *.cu))

ifeq ($(shell uname -m), x86_64)
	ARCH_DIR=PTX64
else
	ARCH_DIR=PTX32
endif

SM_20_PTX=$(patsubst %.cu, $(ARCH_DIR)/sm_20/%.ptx, $(SRC))
SM_30_PTX=$(patsubst %.cu, $(ARCH_DIR)/sm_30/%.ptx, $(SRC))
SM_35_PTX=$(patsubst %.cu, $(ARCH_DIR)/sm_35/%.ptx, $(SRC))
SM_50_PTX=$(patsubst %.cu, $(ARCH_DIR)/sm_50/%.ptx, $(SRC))

all: compute_20 compute_30 compute_35 compute_50

compute_20: .compute_20

compute_30: .compute_30

compute_50: .compute_50

compute_35: .compute_35

.compute_20: $(SM_20_PTX)
	./change_symbols $(ARCH_DIR)/sm_20
	touch $@

.compute_30: $(SM_30_PTX)
	./change_symbols $(ARCH_DIR)/sm_30
	touch $@

.compute_50: $(SM_50_PTX)
	./change_symbols $(ARCH_DIR)/sm_50
	touch $@

.compute_35: $(SM_35_PTX)
	./change_symbols $(ARCH_DIR)/sm_35
	touch $@

$(ARCH_DIR)/sm_20/%.ptx: %.cu .dirs.20
	nvcc -ptx -arch=sm_20 $< -o $@

$(ARCH_DIR)/sm_30/%.ptx: %.cu .dirs.30
	nvcc -ptx -arch=sm_30 $< -o $@

$(ARCH_DIR)/sm_35/%.ptx: %.cu .dirs.35
	nvcc -ptx -arch=sm_35 $< -o $@

$(ARCH_DIR)/sm_50/%.ptx: %.cu .dirs.50
	nvcc -ptx -arch=sm_50 $< -o $@

.dirs.20:
	mkdir -p $(ARCH_DIR)/sm_20
	touch $@

.dirs.30:
	mkdir -p $(ARCH_DIR)/sm_30
	touch $@

.dirs.35:
	mkdir -p $(ARCH_DIR)/sm_35
	touch $@

.dirs.50:
	mkdir -p $(ARCH_DIR)/sm_50
	touch $@

clean:
	rm -f .dirs.*
	rm -f .compute*
	rm -rf $(ARCH_DIR)
