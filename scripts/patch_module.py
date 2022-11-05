# Bootleg script to patch the missing kernel modules in debian 11
import os

module_list = [
    "tgl_guc_69.0.3.bin",
    "adlp_guc_69.0.3.bin",
    "skl_guc_70.1.1.bin",
    "bxt_guc_70.1.1.bin",
    "kbl_guc_70.1.1.bin",
    "glk_guc_70.1.1.bin",
    "cml_guc_70.1.1.bin",
    "icl_guc_70.1.1.bin",
    "ehl_guc_70.1.1.bin",
    "tgl_guc_70.1.1.bin",
    "dg1_guc_70.1.1.bin",
    "adlp_guc_70.1.1.bin",
    "dg2_guc_70.1.2.bin",
    "adlp_dmc_ver2_16.bin",
]

kernel_address = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915"

# Creating a module dir
os.system("mkdir -p ~/modules")
os.system("cd ~/modules")

for module in module_list:
    os.system(
        f"wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/{module}"
    )
