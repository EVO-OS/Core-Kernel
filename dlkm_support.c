#include <linux/module.h>
#include <linux/kernel.h>

static int __init evo_kernel_init(void) {
    printk(KERN_INFO "EVO Kernel Module loaded.\n");
    return 0;
}

static void __exit evo_kernel_exit(void) {
    printk(KERN_INFO "EVO Kernel Module unloaded.\n");
}

module_init(evo_kernel_init);
module_exit(evo_kernel_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("EVO-OS");
MODULE_DESCRIPTION("EVO-OS Kernel DLKM Support");
