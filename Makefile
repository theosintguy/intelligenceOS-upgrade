CURRENT_DIR := $(shell pwd)
VENV := $(CURRENT_DIR)/.venv
PATH := $(VENV)/bin:$(PATH)

VENV_DEPS := ansible molecule
SYS_DEPS := python3 vagrant

define check_venv_deps
    if ! [ -d $(VENV) ]; then \
        echo "[FAIL] missing virtualenv. run 'make venv' first."; \
        exit 1; \
    fi; \
    echo "[OK] found virtualenv"
    for dep in $(VENV_DEPS); do \
        if ! [ -f $(VENV)/bin/$$dep ]; then \
            echo "[FAIL] missing '$$dep' in virtualenv. run 'make deps' first."; \
            exit 1; \
        fi; \
    done; \
    echo "[OK] all virtualenv dependencies are installed"
endef

define check_sys_deps
    for dep in $(SYS_DEPS); do \
        if ! which $$dep &>/dev/null; then \
            echo "[FAIL] missing '$$dep'. please install first"; \
            exit 1; \
        fi; \
    done; \
    echo "[OK] all required system dependencies are installed"
endef


.PHONY: check venv clean

check:
	@$(call check_sys_deps)
	@# also check for virtualbox or other vagrant provider?
	@$(call check_venv_deps)

venv:
	@$(call check_sys_deps) > /dev/null
	@python3 -m venv $(VENV)
	@pip install -U wheel setuptools pip
	@pip install -U -r requirements.txt

clean:
	@([ -d $(VENV) ] && echo "Deleting '$(VENV)'" && rm -rf $(VENV)) || true

