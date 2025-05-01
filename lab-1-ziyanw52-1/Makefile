# Makefile
# May need to change or local testing.
TMP_DIR := tmp

# Default target
all: setup run verify

# Setup environment
setup:
	@echo "Setting up environment..."
	mkdir -p /$(TMP_DIR)/project/{data,scripts,logs,backup}
	@echo "Environment setup complete."

# Run the assignment script
run: setup
	@echo "Running assignment script..."
	chmod +x src/lab1.sh
	src/lab1.sh
	@echo "Script execution complete."

# Verify the environment and output
verify: run
	@echo "Verifying script output..."
	if [ ! -d "/$(TMP_DIR)/project" ]; then echo "Directory 'project' does not exist"; exit 1; fi
	if [ ! -d "/$(TMP_DIR)/project/data" ]; then echo "Directory 'data' does not exist in 'project'"; exit 1; fi
	if [ ! -d "/$(TMP_DIR)/project/scripts" ]; then echo "Directory 'scripts' does not exist in 'project'"; exit 1; fi
	if [ ! -d "/$(TMP_DIR)/project/logs" ]; then echo "Directory 'logs' does not exist in 'project'"; exit 1; fi
	if [ ! -d "/$(TMP_DIR)/project/backup" ]; then echo "Directory 'backup' does not exist in 'project'"; exit 1; fi
	@echo "Verification complete."

# Clean up the environment
clean:
	@echo "Cleaning up..."
	rm -rf /$(TMP_DIR)/project
	@echo "Cleanup complete."
